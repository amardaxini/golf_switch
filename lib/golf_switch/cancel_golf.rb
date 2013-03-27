module GolfSwitch
  class CancelGolf < GolfSwitch::Request
    attr_accessor :course_id,:tee_date,:confirmation_no,:booking_id

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
      super("cancel_golf")
    end

    def parse_error
      @response[:cancel_golf_response][:cancel_golf_result]
    end

    def parse_response
      begin
        unless error?
          @api_response = GolfSwitch::CancelGolfResponse.new(@response[:cancel_golf_response][:cancel_golf_result])
        else
          puts "Error #{error_message}"
        end
      rescue
        puts "Parse Error On Cancel Golf Response"
      end
    end

  end
end