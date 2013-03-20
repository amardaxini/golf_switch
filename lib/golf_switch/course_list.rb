module GolfSwitch
  class CourseList < GolfSwitch::Request
    attr_accessor :country_id,:region_id,:area,:latitude,:longitude,:postal_code
    attr_accessor :max_distance,:max_distance_type,:show_all_status,:show_dis_connected,:featured_only,:sort
    attr_accessor :api_response
    def initialize(attributes = {})
      attributes.each do |name, value|
        begin
          send("#{name}=", value)
        end
      end
      @max_distance_type = "M" unless ["M","K"].include?(@max_distance_type)
      @country_id ||="USA"
    end

    def option_attributes
      options = {}
      options.merge!("CountryId"=>@country_id) unless @country_id.blank?
      options.merge!("RegionId"=>@region_id) unless @region_id.blank?
      options.merge!("Area"=>@area) unless @area.blank?
      options.merge!("Latitude"=>@latitude) unless @latitude.blank?
      options.merge!("Longitude"=>@longitude) unless @longitude.blank?
      options.merge!("PostalCode"=>@postal_code) unless @postal_code.blank?
      options.merge!("MaxDistance"=>@max_distance) unless @max_distance.blank?
      options.merge!("MaxDistanceType"=>@max_distance_type) if !@max_distance.blank? && !@max_distance_type.blank?
      options.merge!("ShowDisConnected"=>@show_dis_connected) unless @show_dis_connected.blank?
      options.merge!("FeaturedOnly"=>@featured_only) unless @featured_only.blank?
      options.merge!("Sort"=>@sort) if !@sort.blank? && ["N",""].include?(@sort)
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
