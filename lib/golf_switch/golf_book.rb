module GolfSwitch
  class GolfBook
    attr_accessor :rc,:msg,:course_id,:course_xid,:course_name,:course_phone,:course_email
    attr_accessor :course_note,:on_req,:play_date,:play_time,:num_players,:confirmation_no
    attr_accessor :booking_id,:tot_greens_fee,:curr_greens_fee,:tot_trans_fee,:tot_cc_charged
    attr_accessor :curr_charged,:tot_voucher_charged,:tot_non_refundable,:tot_golf_pass_rounds
    attr_accessor :img,:cxl_policy,:course_x_id,:rate_policy

    def initialize(attributes={})
      attributes.each do |name, value|
        begin
          if name.to_s=="cxl_policy"
            @cxl_policy = GolfSwitch::CoursePolicy.new(value)
          else
            send("#{name}=", value)
          end
        rescue
          puts "Add #{name} as accessor in Golf Book"
        end
      end
    end

    def self.parse_golf_books(response)
      golf_books = []
      if response[:golf_books] && response[:golf_books][:golf_book].is_a?(Array)
        response[:golf_books][:golf_book].each do |golf_book|
          golf_books << GolfSwitch::GolfBook.new(response[:golf_books][:golf_book])
        end
      elsif response[:golf_books] && response[:golf_books][:golf_book].is_a?(Hash)
        golf_books << GolfSwitch::GolfBook.new(response[:golf_books][:golf_book])
      end
      golf_books
    end

    def to_hash
      hash = {}
      instance_variables.each {|var| hash[var.to_s.delete("@")] = instance_variable_get(var) }
      hash
    end

  end
end