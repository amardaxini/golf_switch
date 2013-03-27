module GolfSwitch
  class GetGolfBooking < GolfSwitch::Request
    attr_accessor :course_id,:tee_date,:confirmation_no,:booking_id,:note

    def initialize(course_id,tee_date,confirmation_no=nil,booking_id=nil)
      @course_id = course_id
      @tee_date = tee_date
      @confirmation_no = confirmation_no
      @booking_id = booking_id
    end

    def get_options
      {
        "Req"=>
          option_attributes
      }
    end

    def option_attributes
      options = {}
      options.merge!("CourseId"=>@course_id)
      options.merge!("TeeDate"=>DateTime.parse(@tee_date).strftime("%Y-%m-%dT00:00:00"))
      options.merge!("ConfirmationNo"=>@confirmation_no) unless @confirmation_no.blank?
      options.merge!("BookingId"=>@booking_id) unless @booking_id.blank?
      options
    end

    def commit
      super("get_golf_booking")
    end

    def parse_error
      @response[:get_golf_booking_response][:get_golf_booking_result]
    end

    def parse_response
      begin
        unless error?
          @api_response = GolfSwitch::GolfBookInfo.new(@response[:get_golf_booking_response][:get_golf_booking_result])
        else
          puts "Error #{error_message}"
        end
      rescue
        puts "Parse Error On Getting golf info Response"
      end
    end

  end
end