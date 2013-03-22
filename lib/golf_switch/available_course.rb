module GolfSwitch
  class AvailableCourse < GolfSwitch::Course
    attr_accessor :rt_type,:f_prc,:t_prc,:curr,:rating_cnt,:max_rew_pts,:cc_allow,:note,:dates,:is_gsw,:rc,:msg,:addr1,:zip
    # ccAllow Comma separated list of allowed credit card types.VI: Visa,MC: Mastercard,AX: American Express,DS: Discover
    def initialize(attributes={})
      @dates = []

      attributes.each do |name, value|
        if name.to_s=="dates"

          parse_date_info(value)
        else
          begin
            send("#{name}=", value)
          rescue
            puts "#{name} attribute is not present"
          end
        end
      end
    end
    def self.parse_courses(response_hash)
      courses= []

      if response_hash[:courses]
        avail_courses= response_hash[:courses][:al_course] || response_hash[:courses][:ca_course]
        if avail_courses.is_a?(Array)
          avail_courses.each do |course|
            begin
              courses  << AvailableCourse.new(course.merge(:img_base=>response_hash[:img_base]))
            end
          end
        elsif avail_courses.is_a?(Hash)
          courses  << AvailableCourse.new(avail_courses.merge(:img_base=>response_hash[:img_base]))
        end
      end
      courses
    end

    def parse_date_info(value)

      if value[:al_date].is_a?(Array)
        value[:al_date].each do |al_date|
          @dates << CourseAvailDate.parse_date_info(al_date)
        end
      elsif value[:al_date].is_a?(Hash)
         @dates << CourseAvailDate.parse_date_info(value[:al_date])
      end
    end


  end

end