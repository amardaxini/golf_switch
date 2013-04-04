module GolfSwitch
  class GetCoursePolicy < GolfSwitch::Request
    attr_accessor :course_id,:play_date,:alt_rate_type,:api_response

    def initialize(attributes={})
      attributes.each do |name, value|
        begin
          send("#{name}=", value)
        rescue
          puts "Add #{name} is not valid"
        end
      end
    end
     def get_options
      {
        "Req"=>
          option_attributes

      }
    end
    def option_attributes
       options = {}
      options.merge!("CourseId"=>@course_id) unless @course_id.blank?
      options.merge!("PlayDate"=>DateTime.parse(@play_date).strftime("%Y-%m-%dT00:00:00")) unless @play_date.blank?
      options.merge!("AltRateType"=>@alt_rate_type) unless @alt_rate_type.blank?
      options
    end

    def commit
      super("get_course_policies")
    end

    def parse_error
      @response[:get_course_policies_response][:get_course_policies_result]
    end

    def parse_response
      begin
        unless error?
          @api_response = GolfSwitch::CoursePolicyResponse.new(@response[:get_course_policies_response][:get_course_policies_result])
        else
          puts "Error #{error_message}"
        end
      rescue
        puts "Parse Error On Getting golf info Response"
      end
    end

  end
end