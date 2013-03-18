module GolfSwitch
  class CourseListCourse < GolfSwitch::Course
    def initialize(attributes={})
      attributes.each do |name, value|
        begin
          send("#{name}=", value)
        end
      end
    end
    def self.parse_courses(response_hash)
      courses= []

      if response_hash[:courses] && response_hash[:courses][:cl_course]
        if response_hash[:courses][:cl_course].is_a?(Array)
          response_hash[:courses][:cl_course].each do |course|
            begin
              courses  << CourseListCourse.new(course.merge(:img_base=>response_hash[:img_base]))
            end
          end
        elsif response_hash[:courses][:cl_course].is_a?(Hash)
          courses  << CourseListCourse.new(response_hash[:courses][:cl_course].merge(:img_base=>response_hash[:img_base]))
        end
      end
      courses
    end
  end
end