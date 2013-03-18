module GolfSwitch
  class CourseAvailTime
    attr_accessor :tm,:allow,:pp_price,:pp_reg_price,:pp_txn_fee,:curr,:pp_txn_free,:pp_charge,:chrg_curr,:pp_non_ref,:pp_net_rt,:pp_rew_pts,:inc,:info,:flags

    def initialize(attributes={})
      attributes.each do |name, value|
        begin
          send("#{name}=", value)
        end
      end
    end

  end
end