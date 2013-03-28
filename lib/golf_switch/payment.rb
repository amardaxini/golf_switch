module GolfSwitch

  class Payment
    # cc_type  is VI: Visa,MC: MastercardAX: American Express only
    attr_accessor :pay_type,:cc_type,:pay_number,:cc_exp_mo,:cc_exp_yr,:cc_cvv
    attr_accessor :cc_name,:cc_address1,:cc_city,:cc_state,:cc_country,:cc_postal_code,:cc_email
    attr_accessor :cc_phone,:pay_amount,:pay_curr
    def initialize(attributes={})
      attributes.each do |name, value|
        begin
          send("#{name}=", value)
        rescue
          puts "invalid attribute #{name} in payment"
        end
      end
    end

    def option_attributes
      options = {}
      options.merge!("PayType"=>@pay_type || "CC")
      options.merge!("CcType"=>@cc_type|| "VI")
      options.merge!("PayNumber"=>@pay_number)
      options.merge!("CcExpMo"=>@cc_exp_mo)
      options.merge!("CcExpYr"=>@cc_exp_yr)
      options.merge!("CcCVV"=>@cc_cvv) unless @cc_cvv.blank?
      options.merge!("CcName"=>@cc_name)
      options.merge!("CcAddress1"=>@cc_address1)
      options.merge!("CcCity"=>@cc_city)
      options.merge!("CcState"=>@cc_state)
      options.merge!("CcCountry"=>@cc_country || "USA")
      options.merge!("CcPostalCode"=>@cc_postal_code)
      options.merge!("CcEmail"=>@cc_email) unless @cc_email.blank?
      options.merge!("CcPhone"=>@cc_phone) unless @cc_phone.blank?
      options.merge!("PayAmount"=>@pay_amount)
      options.merge!("PayCurr"=>@pay_curr || "USD")

    end
  end
end