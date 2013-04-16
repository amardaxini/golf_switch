module GolfSwitch
  class CourseAvailTime
    attr_accessor :tm,:allow,:pp_price,:pp_reg_price,:pp_txn_fee,:curr,:pp_txn_free,:pp_charge,:chrg_curr,:pp_non_ref,:pp_net_rt,:pp_rew_pts,:inc,:info,:flags
    alias :per_person_price :pp_price
    alias :per_person_charge :pp_charge
    def initialize(attributes={})
      attributes.each do |name, value|
        begin
          send("#{name}=", value)
        end
      end
    end
    def no_of_allowed_player
      @allow.split("").count{|p| p=='Y'}
    end

    def min_player
      min_index = @allow.split("").index("N")
      min_index.blank? ? 1 : min_index+1
    end

    def max_player
      begin
        @allow.split("").rindex("Y")+1
      rescue
        no_of_allowed_player
      end
    end

  end
end