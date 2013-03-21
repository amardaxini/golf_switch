module GolfSwitch
  class CourseInfoCourse < GolfSwitch::Course
    attr_accessor :from_price,:to_price,:curr,:note,:short_promo,:rating_cnt,:max_reward_points,:addr1,:zip
    attr_accessor :cc_allow,:allow_players,:year_built,:holes,:designer,:greens,:imgs,:services
    attr_accessor :has_net_rates,:has_trade,:cxl_policy,:payment_terms,:score_card,:dress_code

    def initialize(attributes={})
      @score_card= []
      @imgs = []
      @img_base = attributes[:img_base]
      attributes.each do |name, value|
        begin
          if name.to_s=="imgs"
            parse_images(value)
          elsif  name.to_s =="cxl_policy"
            @cxl_policy = GolfSwitch::CoursePolicy.new(value)
          elsif name.to_s == "score_card"
            parse_score_card(value[:yardages])
          else
            send("#{name}=", value)
          end
        rescue
          puts "Add #{name} as accessor in Corse Info Course"
        end
      end

    end
    def parse_score_card(yardages)
      if yardages[:yardage].is_a?(Array)
        yardages[:yardage].each do |yard_age|
          score_card << GolfSwitch::ScoreCard.new(yard_age)
        end
      elsif yardages[:yardage].is_a?(Hash)
        score_card << GolfSwitch::ScoreCard.new(yardages[:yardage])
      end

    end

    def parse_images(imgs)
      if imgs[:img].is_a?(Array)
        imgs[:img].each do |img|
          @imgs << GolfSwitch::CourseImage.new(img,self.img_base)
        end
      elsif img[:img].is_a?(Hash)
        @imgs << GolfSwitch::CourseImage.new(imgs[:img],self.img_base)
      end
    end

    def no_of_allowed_player
      @allow_players.split("").count{|p| p=='Y'}
    end

    def self.parse_course(response_hash)
      CourseInfoCourse.new(response_hash[:course].merge(:img_base=>response_hash[:img_base]))
    end

  end
end