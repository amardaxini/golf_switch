module GolfSwitch
  class Course
    attr_accessor :id,:xid,:on_req,:nm,:cty,:st,:cou,:s_cou,:s_reg,:s_ar,:lat,:lon,:adv_days,:inside_days,:dist,:promo,:ratin,:img,:img_base
    alias :name :nm
    alias :country :cou
    alias :state :st
    alias :city :cty
    alias :country_id :s_cou
    alias :regon_id :s_reg
    alias :area_id :s_ar



    def img_url
      "#{img_base.to_s}/#{self.id}/#{img.to_s}"
    end


  end
end