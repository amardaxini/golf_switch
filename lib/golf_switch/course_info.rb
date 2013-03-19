module GolfSwitch
  class CourseInfo < GolfSwitch::Request
    attr_accessor :course_id,:api_response

    def initialize(course_id)
      @course_id = course_id
    end

    def get_options
      {
        "Req"=>{
          "CourseId"=>@course_id
        }
      }
    end

    def commit
      super("course_info")
    end

    def parse_error
      @response[:course_info_response][:course_info_result]
    end

    def parse_response
      begin
        unless error?
          @api_response = CourseInfoCourse.parse_course(@response[:course_info_response][:course_info_result])
        else
          puts "Error #{error_message}"
        end
      rescue
        puts "Error On Parsing Response"
      end
    end

  end
end