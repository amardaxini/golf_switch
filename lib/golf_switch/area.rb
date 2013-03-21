 module GolfSwitch
  class Area < GolfSwitch::Request
    attr_accessor :country_id,:region_id,:api_response
    def initialize(attributes = {})
      attributes.each do |name, value|
        send("#{name}=", value)
      end
      @area_response = []
    end

    def get_options
      {
        "Req"=>
          option_attributes

      }
    end

    def option_attributes
      options = {}
      options.merge!("CountryId"=>@country_id) unless @country_id.blank?
      options.merge!("RegionId"=>@region_id) unless @region_id.blank?
      options
    end

    def commit
      super("areas")
    end

    def parse_error
      @response[:areas_response][:areas_result]
    end

    def parse_response
      begin
        unless error?
          @api_response = AreaResponse.parse_areas(@response[:areas_response][:areas_result])
        else
          puts "Error #{error_message}"
        end
      rescue

      end
    end

  end
 end
