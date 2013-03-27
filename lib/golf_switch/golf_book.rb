module GolfSwitch
  class GolfBook
    attr_accessor :rc,:msg,:course_id,:course_xid,:course_name,:course_phone,:course_email
    attr_accessor :course_note,:on_req,:play_date,:play_time,:num_players,:confirmation_no
    attr_accessor :booking_id,:tot_greens_fee,:curr_greens_fee,:tot_trans_fee,:tot_cc_charged
    attr_accessor :curr_charged,:tot_voucher_charged,:tot_non_refundable,:tot_golf_pass_rounds
    attr_accessor :img,:cxl_policy

    def initialize(attibutes={})
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
      if response[:golf_books].is_a?(Array)
        response[:golf_books].each do |golf_book|
          golf_books << GolfSwitch::GolfBook.new(response[:golf_books])
        end
      elsif response[:golf_books].is_a?(hash)
        golf_books << GolfSwitch::GolfBook.new(response[:golf_books])
      end
      golf_books

    end
  end
end