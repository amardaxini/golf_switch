
module GolfSwitch
  class Request
    attr_accessor :client,:config,:response,:request
    def commit(method_name)

      @config =GolfSwitch.configuration
      @client = Savon.client({:wsdl=>"https://devxml.golfswitch.com/golfservice.asmx?WSDL"})
      # Available Operations
#     [:areas,:course_list,:course_info,:course_avail_list,:course_avail,:book_golf,
#      :get_golf_booking,:cancel_golf, :get_alt_rate_types,:get_course_policies]
      @request = @client.call(method_name.to_sym) do
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
    def soap_fault?
      @response.is_a?(Savon::SOAP::Fault)
    end
    def error?
      parse_error[:ret_cd].to_i != 0
    end

    def error_message
      parse_error[:ret_msg]
    end

  end
end