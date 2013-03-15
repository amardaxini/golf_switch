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
        "Req"=>{
          "CountryId"=>@country_id,
          "RegionId"=>@regionId_id
        }
      }
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
# GolfSwitch.configure do |config|
#   config.reseller_id="GHE"
#   config.partner_id=""
#   config.source_cd="A"
#   config.lang=""
#   config.user_ip="120.62.171.129"
#   config.user_session_id=""
#   config.access_key=""
#   config.gs_source=""
# end
# area1 = GolfSwitch::Area.new({:country_id=>"USA"})
# area1.make_request
# area1.response.body
# {:areas_response=>
#   {:areas_result=>{:ret_cd=>"-101", :ret_msg=>"Invalid Lang"},
#    :@xmlns=>"http://xml.golfswitch.com/"}}

# client1 =Savon.client(:wsdl=>"https://devxml.golfswitch.com/golfservice.asmx?WSDL")
# client1.request :areas do
#   soap.body = {
#     "hdr" => {"ReselerId"=>"123"}
#   }
# end
# binding.pry
# response = client1.call(:areas) do
#  message  "hdr"=>{"ReselerId" =>"luke","PartnerId" =>"luke123"}

# end
# client.call(:areas) do |x|


# end