module GolfSwitch
  class CourseAvailDate
    attr_accessor :dt,:al_times
    alias :date :dt

    def initialize
      @al_times = []
    end

    def self.parse_date_info(al_date)

      avail_date = CourseAvailDate.new
      avail_date.dt= al_date[:dt]
      if al_date[:times] && al_date[:times][:al_time].is_a?(Array)
        al_date[:times][:al_time].each do |al_time|
          avail_date.al_times << CourseAvailTime.new(al_time)
        end
      elsif al_date[:times] && al_date[:times][:al_time].is_a?(Hash)
        avail_date.al_times << CourseAvailTime.new(al_date[:times][:al_time])
      end
      avail_date
    end

  end
end