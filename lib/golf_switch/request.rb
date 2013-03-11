
module GolfSwitch
  class Request
    attr_accessor :client,:config,:response,:request
    def make_request

      @config =GolfSwitch.configuration
      @client = Savon.client({:wsdl=>"https://devxml.golfswitch.com/golfservice.asmx?WSDL"})
      @request = @client.call(:areas) do
        message  get_authentication_header.merge(get_options)
      end
      @response = @request.body

    end
    def get_authentication_header

      {
         "Hdr"=>{
          "ResellerId"=>@config.reseller_id,
          "PartnerId"=>@config.partner_id,
          "SourceCd"=>@config.source_cd || "A",
          "Lang"=>@config.lang,
          "UserIp"=>@config.user_ip,
          "UserSessionId"=>@config.user_session_id,
          "AccessKey"=>@config.access_key,
          "Agent"=>@config.agent,
          "gsSource"=>@config.gs_source,
          "gsDebug"=>@config.gs_debug || false

        }
      }
    end

    def error?
      parse_response[:ret_cd].to_i != 0
    end

    def error_message
      parse_response[:ret_msg].to_i != 0 if error?
    end

  end
end