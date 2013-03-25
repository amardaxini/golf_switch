module GolfSwitch
  class CourseInfoCourse < GolfSwitch::Course
    attr_accessor :from_price,:to_price,:curr,:note,:short_promo,:rating_cnt,:max_reward_points,:addr1,:zip
    attr_accessor :cc_allow,:allow_players,:year_built,:holes,:designer,:greens,:imgs,:services
    attr_accessor :has_net_rates,:has_trade,:cxl_policy,:payment_terms,:score_card,:dress_code
    attr_accessor :yard_ages,:pars,:handicaps

    def initialize(attributes={})
      @yard_ages= []
      @pars = []
      @handicaps = []
      @imgs = []
      attributes.each do |name, value|
        begin
          if name.to_s=="imgs"
            parse_images(value)
          elsif  name.to_s =="cxl_policy"
            @cxl_policy = GolfSwitch::CoursePolicy.new(value)
          elsif name.to_s == "score_card"
            @yard_ages = parse_score_card((value[:yardages][:yardage] rescue nil))
            @pars = parse_score_card((value[:pars][:par] rescue nil))
            @handicaps  =parse_score_card((value[:handicaps][:handicap] rescue nil))
          else
            send("#{name}=", value)
          end
        rescue
          puts "Add #{name} as accessor in Corse Info Course"
        end
      end
      set_course_image

    end
    def set_course_image
      unless @imgs.grep(/overview/).blank?
        @img = @imgs.grep(/overview/).first
      else
        @img = @imgs[0]
      end

    end

    def parse_score_card(scores)
      score_card =[]
      if scores.is_a?(Array)
        scores.each do |score|
          score_card << GolfSwitch::ScoreCard.new(score)
        end
      elsif scores.is_a?(Hash)
        score_card << GolfSwitch::ScoreCard.new(scores)
      end
      score_card
    end

    def parse_images(imgs)
      if imgs[:img].is_a?(Array)
        imgs[:img].each do |img|
          @imgs << img
        end
      elsif imgs[:img].is_a?(String)
        @imgs << imgs[:img]
      end
    end

    def no_of_allowed_player
      @allow_players.split("").count{|p| p=='Y'}
    end

    def self.parse_course(response_hash)
      CourseInfoCourse.new(response_hash[:course].merge(:img_base=>response_hash[:img_base]))
    end

    def images(protocol="https")
      images = []
      self.imgs.each do |img|
        images << build_url(img,protocol)
      end
      images
    end

    protected
    def build_url(img,protocol="https")
      if img
        "#{protocol}://#{self.img_base.to_s}/#{self.id}/#{img.to_s}"
      else
         ""
      end
    end

  end
end