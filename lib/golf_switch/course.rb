module GolfSwitch
  class Course
    attr_accessor :id,:xid,:on_req,:nm,:cty,:st,:cou,:s_cou,:s_reg,:s_ar,:lat,:lon,:adv_days,:inside_days,:dist,:promo,:ratin,:img,:img_base
    alias :name :nm

    def img_url
      "#{img_base.to_s}/#{self.id}/#{img.to_s}"
    end


  end
end