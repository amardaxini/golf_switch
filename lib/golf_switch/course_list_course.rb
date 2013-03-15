module GolfSwitch
  class CourseListCourse < GolfSwitch::Course
    attr_accessor :rating
    def initialize(attributes={})
      attributes.each do |name, value|
        send("#{name}=", value)
      end
    end
    def self.parse_courses(response_hash)
      courses= []

      if response_hash[:courses] && response_hash[:courses][:cl_course]
        Array(response_hash[:courses][:cl_course]).each do |course|
          begin
            courses  << CourseListCourse.new(course.merge(:img_base=>response_hash[:img_base]))
          end
        end
      end
      courses
    end
  end
end