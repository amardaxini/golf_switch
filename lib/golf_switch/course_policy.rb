module GolfSwitch
  class CoursePolicy
    attr_accessor :qty,:type,:desc

    def initialize(attributes={})
      attributes.each do |name, value|
        begin
          send("#{name}=", value)
        end
      end
    end

  end
end