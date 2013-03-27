module GolfSwitch
  class CoursePolicyResponse
    attr_accessor :ret_cd,:ret_msg,:note,:cxl_policy,:rate_policy,:misc_policies
    def initialize(attributes={})
      attributes.each do |name, value|
        begin
          if  name.to_s =="cxl_policy"
            @cxl_policy = GolfSwitch::CoursePolicy.new(value)
          else
            send("#{name}=", value)
          end
        rescue
          puts "Add #{name} is accessor in course policy response"
        end
      end
    end
  end
end