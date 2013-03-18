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
      options.merge!("CountryId"=>@country_id) if @country_id
      options.merge!("RegionId"=>@region_id) if @region_id
      options.merge!("Area"=>@area) if @area

      options.merge!("PlayBegDate"=>(DateTime.parse(@play_beg_date).strftime("%Y-%m-%dT00:00:00"))) if @play_beg_date

      options.merge!("PlayEndDate"=>(DateTime.parse(@play_end_date).strftime("%Y-%m-%dT00:00:00"))) if @play_end_date

      options.merge!("Time"=>@time) if @time
      options.merge!("Players"=>@players) if @players
      options.merge!("AltRateType"=>@alt_rate_type) if @alt_rate_type
      options.merge!("PromoCode"=>@promo_code) if @promo_code

      options.merge!("Latitude"=>@latitude) if @latitude
      options.merge!("Longitude"=>@longitude) if @longitude
      options.merge!("PostalCode"=>@postal_code) if @postal_code
      options.merge!("MaxDistance"=>@max_distance) if @max_distance
      options.merge!("MaxDistanceType"=>@max_distance_type) if @max_distance && @max_distance_type
      options.merge!("FeaturedOnly"=>@featured_only) if @featured_only

      options.merge!("ShowAllTimes"=>@show_all_times) if @show_all_times
      options.merge!("ShowIfNoTimes"=>@show_if_no_times) if @show_if_no_times
      options.merge!("BarterOnly"=>@barter_only) if @barter_only
      options.merge!("ChargingOnly"=>@charging_only) if @charging_only
      options.merge!("SpecialsOnly"=>@specials_only) if @specials_only
      options.merge!("RegularRateOnly"=>@regular_rate_only) if @regular_rate_only
      options.merge!("ProfileId"=>@profile_id) if @profile_id


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