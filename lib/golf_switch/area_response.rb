module GolfSwitch
  class AreaResponse
    attr_accessor :area_id,:name,:countries
    def initialize(area_id=nil,name=nil)
      @area_id = area_id
      @name = name
      @countries= []
    end

    def self.parse_areas(response_hash)
      areas = AreaResponse.new
      unless response_hash[:countries] && response_hash[:countries].blank?
        # Searching for single country
        if response_hash[:countries][:country] && response_hash[:countries][:country].is_a?(Hash)
          areas.countries << Country.parse_country(response_hash[:countries][:country])
        elsif response_hash[:countries][:country] && response_hash[:countries][:country].is_a?(Array)
          response_hash[:countries][:country].each do |country|
            areas.countries << Country.parse_country(country)
          end
        end
      end
      areas
    end

  end
end