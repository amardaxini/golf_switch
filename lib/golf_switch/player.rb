module GolfSwitch
  class Player
    attr_accessor :profile_id,:first_name,:last_name,:email,:phone,:address1,:city
    attr_accessor :state,:country,:postal_code,:member_no,:handicap,:rewards_pgm_id,:rewards_id

    def initialize(attributes={})
      attributes.each do |name, value|
        begin
          send("#{name}=", value)
        rescue
          puts "invalid attribute #{name} in player"
        end
      end
    end

    def option_attributes
      options = {}
      options.merge!("ProfileId"=>@profile_id) unless @profile_id.blank?
      options.merge!("FirstName"=>@first_name)
      options.merge!("LastName"=>@last_name)
      options.merge!("Email"=>@email)
      options.merge!("Phone"=>@phone)
      options.merge!("Address1"=>@address1) unless @address1.blank?
      options.merge!("City"=>@city)
      options.merge!("State"=>@state)
      options.merge!("Country"=>@country || "USA")
      options.merge!("PostalCode"=>@postal_code)
      options.merge!("MemberNo"=>@member_no) unless @member_no.blank?
      options.merge!("Handicap"=>@handicap) unless @handicap.blank? && @handicap!="Handicap"
      options.merge!("RewardsPgmId"=>@rewards_pgm_id) unless @rewards_pgm_id.blank?
      options.merge!("RewardsId"=>@rewards_id) unless @rewards_id.blank?
      options
    end
  end
end