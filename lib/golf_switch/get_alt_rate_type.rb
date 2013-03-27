module GolfSwitch
  class GetAltRateType  < GolfSwitch::Request
    attr_accessor :alt_rate_type_id

    def initialize(alt_rate_type_id)
      @alt_rate_type_id = alt_rate_type_id
    end

     def get_options
      {
        "Req"=>option_attributes
      }
    end

    def option_attributes
      {
        "AltRateTypeId"=>@alt_rate_type_id
      }
    end

    def commit
      super("get_alt_rate_types")
    end

    def parse_error
      @response[:GetAltRateTypesResponse][:get_alt_rate_types_result]
    end

    def parse_response
      begin
        unless error?
          @api_response = GolfSwitch::GolfBook.parse_golf_books(@response[:book_golf_response][:book_golf_result])
        else
          puts "Error #{error_message}"
        end
      rescue
        puts "Parse Error On Alt Rare type"
      end
    end

  end
end