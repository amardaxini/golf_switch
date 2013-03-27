module GolfSwitch
  class BookGolf < GolfSwitch::Request
    attr_accessor :book_golf_items,:api_response
    def initialize
      @book_golf_items = []
    end

    def get_options
      {
        "Req"=>option_attributes

      }
    end
    def option_attributes
      {
        "BookGolfItems"=>{"BookGolfItem"=>@book_golf_items.collect{|bgi| bgi.option_attributes}}
      }
    end

    def commit
      super("book_golf")
    end

    def parse_error
      @response[:book_golf_response][:book_golf_result]
    end

    def parse_response
      begin
        unless error?
          @api_response = GolfSwitch::GolfBook.parse_golf_books(@response[:book_golf_response][:book_golf_result])
        else
          puts "Error #{error_message}"
        end
      rescue
        puts "Parse Error On Book Golf"
      end
    end

  end
end