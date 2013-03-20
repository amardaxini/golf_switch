module GolfSwitch
  class CourseAvailList < GolfSwitch::Request
    attr_accessor :country_id,:region_id,:area
    attr_accessor :play_beg_date,:play_end_date,:time,:players,:alt_rate_type,:promo_code
    attr_accessor :latitude,:longitude,:postal_code,:max_distance,:max_distance_type,:featured_only
    attr_accessor :show_all_times,:show_if_no_times,:barter_only,:charging_only,:specials_only,:regular_rate_only
    attr_accessor :profile_id,:api_response
    # play_beg_date,play_end_date is "yyyy-mm-dd" format
    # Time HHMM format
    def initialize(attributes = {})

      attributes.each do |name, value|
        begin
          send("#{name}=", value)
        end
      end
      @max_distance_type = "M" unless ["M","K"].include?(@max_distance_type)
      @country_id ||= "USA"
      @play_end_date||= @play_beg_date
    end

    def option_attributes
      options = {}
      options.merge!("CountryId"=>@country_id) unless @country_id.blank?
      options.merge!("RegionId"=>@region_id) unless @region_id.blank?
      options.merge!("Area"=>@area) unless @area.blank?

      options.merge!("PlayBegDate"=>(DateTime.parse(@play_beg_date).strftime("%Y-%m-%dT00:00:00"))) unless @play_beg_date.blank?

      options.merge!("PlayEndDate"=>(DateTime.parse(@play_end_date).strftime("%Y-%m-%dT00:00:00"))) unless @play_end_date.blank?

      options.merge!("Time"=>@time) unless @time.blank?
      options.merge!("Players"=>@players) unless @players.blank?
      options.merge!("AltRateType"=>@alt_rate_type) unless @alt_rate_type.blank?
      options.merge!("PromoCode"=>@promo_code) unless @promo_code.blank?

      options.merge!("Latitude"=>@latitude) unless @latitude.blank?
      options.merge!("Longitude"=>@longitude) unless @longitude.blank?
      options.merge!("PostalCode"=>@postal_code) unless @postal_code.blank?
      options.merge!("MaxDistance"=>@max_distance) unless @max_distance.blank?
      options.merge!("MaxDistanceType"=>@max_distance_type) if !@max_distance.blank? && !@max_distance_type.blank?
      options.merge!("FeaturedOnly"=>@featured_only) unless @featured_only.blank?

      options.merge!("ShowAllTimes"=>@show_all_times) unless @show_all_times.blank?
      options.merge!("ShowIfNoTimes"=>@show_if_no_times) unless @show_if_no_times.blank?
      options.merge!("BarterOnly"=>@barter_only) unless @barter_only.blank?
      options.merge!("ChargingOnly"=>@charging_only) unless @charging_only.blank?
      options.merge!("SpecialsOnly"=>@specials_only) unless @specials_only.blank?
      options.merge!("RegularRateOnly"=>@regular_rate_only) unless @regular_rate_only.blank?
      options.merge!("ProfileId"=>@profile_id) unless @profile_id.blank?


      options
    end

    def get_options
      {
        "Req"=>
          option_attributes
      }
    end

    def commit
      super("course_avail_list")
    end

    def parse_error
      @response[:course_avail_list_response][:course_avail_list_result]
    end

    def parse_response
      begin
        unless error?
          @api_response = AvailableCourse.parse_courses(@response[:course_avail_list_response][:course_avail_list_result])
        else
          puts "Error #{error_message}"
        end
      rescue

      end
    end

  end

end