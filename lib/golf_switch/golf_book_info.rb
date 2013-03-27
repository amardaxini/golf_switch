module GolfSwitch
  class GolfBookInfo
    attr_accessor :ret_cd,:ret_msg,:res_name,:course_id,:course_xid,:course_name,:tee_date
    attr_accessor :tee_time,:players,:tot_greens_fee,:greens_fee_curr
    attr_accessor :tot_trans_fee,:tot_cc_charged,:curr_charged,:charge_curr,:tot_non_refundable
    attr_accessor :tot_voucher_charged,:tot_cc_credited,:tot_voucher_credited,:cancellation_no
    def initialize(attributes={})
      attributes.each do |name, value|
        begin
          send("#{name}=", value)
        rescue
          puts "Add #{name} as accessor in Golf Book Response"
        end
      end
    end
  end
end