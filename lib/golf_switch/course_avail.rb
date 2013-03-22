module GolfSwitch
  class CourseAvail < GolfSwitch::Request
    attr_accessor :course_id,:play_beg_date,:play_end_date,:time,:players,:alt_rate_type,:promo_code
    attr_accessor :member_no,:member_no2,:member_no3,:member_no4
    attr_accessor :show_all_times,:barter_only,:charging_only,:specials_only,:regular_rate_only,:profile_id,:api_response

    def initialize(attributes = {})
      attributes.each do |name, value|
        begin
          send("#{name}=", value)
        end
      end
      @play_end_date||= @play_beg_date
    end

    def option_attributes
      options = {}
      options.merge!("CourseId"=>@course_id) unless @course_id.blank?
      options.merge!("PlayBegDate"=>(DateTime.parse(@play_beg_date).strftime("%Y-%m-%dT00:00:00"))) unless @play_beg_date.blank?
      options.merge!("PlayEndDate"=>(DateTime.parse(@play_end_date).strftime("%Y-%m-%dT00:00:00"))) unless @play_end_date.blank?

      options.merge!("MemberNo"=>@member_no) unless @member_no.blank?
      options.merge!("MemberNo2"=>@member_no2) unless @member_no2.blank?
      options.merge!("MemberNo3"=>@member_no3) unless @member_no3.blank?
      options.merge!("MemberNo4"=>@member_no4) unless @member_no4.blank?

      options.merge!("Time"=>@time) unless @time.blank?
      options.merge!("Players"=>@players) unless @players.blank?
      options.merge!("AltRateType"=>@alt_rate_type) unless @alt_rate_type.blank?
      options.merge!("PromoCode"=>@promo_code) unless @promo_code.blank?
      options.merge!("ShowAllTimes"=>@show_all_times) unless @show_all_times.blank?
      options.merge!("BarterOnly"=>@barter_only) unless @barter_only.blank?
      options.merge!("ChargingOnly"=>@charging_only) unless @charging_only.blank?
      options.merge!("SpecialsOnly"=>@specials_only) unless @specials_only.blank?
      options.merge!("RegularRateOnly"=>@regular_rate_only) unless @regular_rate_only.blank?
      options.merge!("ProfileId"=>@profile_id) unless @profile_id.blank?
      options
    end

    def commit
      super("course_avail")
    end

    def get_options
      {
        "Req"=>{
          "CourseAvailRequest"=>option_attributes
        }

      }
    end

    def parse_error
      @response[:course_avail_response][:course_avail_result]
    end

    def parse_response
      begin
        unless error?
          binding.pry
          @api_response = AvailableCourse.parse_courses(@response[:course_avail_response][:course_avail_result])
        else
          puts "Error #{error_message}"
        end
      rescue

      end
    end
  end
end