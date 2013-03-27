module GolfSwitch
  class BookGolfItem
    attr_accessor :course_id,:play_date,:play_time,:num_players,:alt_rate_type,:promo_code
    attr_accessor :pp_price,:curr,:pp_txn_fee,:pp_charge,:chrg_curr,:pp_non_ref,:pp_net_rt
    attr_accessor :tot_price,:tot_txn_fee,:tot_charge,:tot_non_ref,:tot_net_rt,:flags
    attr_accessor :package_id,:book_notes,:ignore_pricing,:players,:payment
    def initialize
      @players = []
    end

    def option_attributes
      options = {}
      options.merge!("CourseId"=>@course_id) unless @course_id.blank?
      options.merge!("PlayDate"=>(DateTime.parse(@play_date).strftime("%Y-%m-%dT00:00:00")))
      options.merge!("PlayTime"=>@play_time)
      options.merge!("NumPlayer"=>@num_players)
      options.merge!("AltRateType"=>@alt_rate_type)
      options.merge!("PromoCode"=>@promo_code)
      options.merge!("PpPrice"=>@pp_price)
      options.merge!("Curr"=>@curr||"USD")
      options.merge!("PpTxnFee"=>@pp_txn_fee)
      options.merge!("PpCharge"=>@pp_charge)
      options.merge!("ChrgCurr"=>@chrg_curr)
      options.merge!("PpNonRef"=>@pp_non_ref)
      options.merge!("PpNetRt"=>@pp_net_rt)
      options.merge!("TotPrice"=>@tot_price)
      options.merge!("TotTxnFee"=>@tot_txn_fee)
      options.merge!("TotCharge"=>@tot_charge)
      options.merge!("TotNonRef"=>@tot_non_ref)
      options.merge!("TotNetRt"=>@tot_net_rt)
      options.merge!("Flags"=>@flags)
      options.merge!("PackageId"=>@package_id)
      options.merge!("BookNotes"=>@book_notes)
      options.merge!("IgnorePricing"=>@ignore_pricing)
      options.merge!("IgnorePricing"=>@ignore_pricing)
      options["Players"]=>{"Player"=>@players.collect{|x| x.option_attributes}}
      options["Payments"]=>{"Payment"=>@payment.option_attributes}
      options
    end
  end
end