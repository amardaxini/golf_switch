# avail_course  = GolfSwitch::CourseAvailRequest.new
# avail_course.course_avails <<  GolfSwitch::CourseAvail.new(options)
# avail_course.course_avails <<  GolfSwitch::CourseAvail.new(options)
# avail_course.commit

module GolfSwitch
  class CourseAvailRequest < GolfSwitch::Request
    attr_accessor :course_avails,:api_response

    def initialize
      @course_avails = []
    end

    def commit
      super("course_avail")
    end

    def course_avail_attributes
      option_attributes = []
      Array(@course_avails).flatten.compact.each do |avail|
        if avail.is_a?(GolfSwitch::CourseAvail)
          option_attributes << avail.option_attributes
        else
          # Raise an error it should be an object of course Avail
        end
      end
      option_attributes
    end

    def get_options
      {
        "Req"=>{
          "CourseAvailRequest"=>course_avail_attributes
        }

      }
    end

    def parse_error
      @response[:course_avail_response][:course_avail_result]
    end

    def parse_response
      begin
        unless error?
          @api_response = AvailableCourse.parse_courses(@response[:course_avail_response][:course_avail_result])
        else
          puts "Error #{error_message}"
        end
      rescue

      end
    end

  end
end