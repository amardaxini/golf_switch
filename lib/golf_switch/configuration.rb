module GolfSwitch
  class Configuration
    attr_accessor :reseller_id,:partner_id,:source_cd,:lang,:user_ip,:user_session_id,:access_key,:gs_source,:gs_debug,:golf_switch_wsdl,:agent,:mode
    def initialize(mode="development")
      @reseller_id,@partner_id,@source_cd,@lang,@user_ip,@user_session_id,@access_key,@gs_source,@agent=nil
      @gs_debug= true
      @mode = mode
      get_golf_switch_wsdl
    end

    def get_golf_switch_wsdl
      if @mode=="development"
        @golf_switch_wsdl "https://devxml.golfswitch.com/golfservice.asmx?WSDL"
      elsif @mode=="production"
        @golf_switch_wsdl"https://xml.golfswitch.com/golfService.asmx?WSDL"
      end

    end
  end
  class << self
    attr_accessor :configuration
  end
  def self.configure

    self.configuration = Configuration.new
    yield(configuration) if block_given?
  end
end