module GolfSwitch
  class CancelGolfResponse < GolfSwitch::GolfBookInfo
    attr_accessor :confirmation_no,:tot_voucher_charged,:tot_cc_credited,:tot_voucher_credited,:cancellation_no


    def initialize(attributes={})
      attributes.each do |name, value|
        begin
          send("#{name}=", value)
        rescue
          puts "Add #{name} as accessor in Cancel Golf Response"
        end
      end
    end
  end
end