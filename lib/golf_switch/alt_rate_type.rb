module GolfSwitch
  class AltRateType
    attr_accessor :id,:nm,:desc

    def initialize(attributes={})
      attributes.each do |name, value|
        begin
          send("#{name}=", value)
        rescue
          puts "Add #{name} to accessor in alt rate type"
        end
      end
    end

    def self.patse_alt_rate_types(response)
      alt_rate_types = []
      if response[:alt_rate_types].is_a?(Array)
        response[:alt_rate_types].each do |alt_rate_type|
          alt_rate_types << GolfSwitch::AltRateType.new(alt_rate_types)
        end
      elsif response[:alt_rate_types].is_a?(Hash)
        alt_rate_types << GolfSwitch::AltRateType.new(response[:alt_rate_types])
      end
      alt_rate_types
    end

  end
end