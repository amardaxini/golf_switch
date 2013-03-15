module GolfSwitch
  class CourseList < GolfSwitch::Request
    attr_accessor :country_id,:region_id,:area,:latitude,:longitude,:postal_code
    attr_accessor :max_distance,:max_distance_type,:show_all_status,:show_dis_connected,:featured_only,:sort
    attr_accessor :api_response
    def initialize(attributes = {})
      attributes.each do |name, value|
        send("#{name}=", value)
      end
      @max_distance_type = "M" unless ["M","K"].include?(@max_distance_type)
      @country_id ||="USA"
    end

    def option_attributes
      options = {}
      options.merge!("CountryId"=>@country_id) if @country_id
      options.merge!("RegionId"=>@regionId_id) if @region_id
      options.merge!("Area"=>@area) if @area
      options.merge!("Latitude"=>@latitude) if @latitude
      options.merge!("Longitude"=>@longitude) if @longitude
      options.merge!("PostalCode"=>@postal_code) if @postal_code
      options.merge!("MaxDistance"=>@max_distance) if @max_distance
      options.merge!("MaxDistanceType"=>@max_distance_type) if @max_distance && @max_distance_type
      options.merge!("ShowDisConnected"=>@show_dis_connected) if @show_dis_connected
      options.merge!("FeaturedOnly"=>@featured_only) if @featured_only
      options.merge!("Sort",@sort) if @sort && ["N",""].include?(@sort)
      options
    end

    def get_options
      {
        "Req"=>
          option_attributes

      }
    end

    def commit
      super("course_list")
    end

    def parse_error
      @response[:course_list_response][:course_list_result]
    end

    def parse_response
      begin
        unless error?
          @api_response = CourseListCourse.parse_courses(@response[:course_list_response][:course_list_result])
        else
          puts "Error #{error_message}"
        end
      rescue

      end
    end

  end

end
