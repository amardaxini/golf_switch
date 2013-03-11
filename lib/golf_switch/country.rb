module GolfSwitch
  class Country < AreaResponse
    attr_accessor :country_regions
    def initialize(area_id=nil,name=nil)
      super(area_id,name)
      @country_regions = []
    end

    def self.parse_country(country)
      golfswitch_country = Country.new(country[:id],country[:nm])
      golfswitch_country.parse_regions(country[:regions])
      golfswitch_country
    end

    def parse_regions(regions)

      if regions[:region] && regions[:region].is_a?(Array)
        regions[:region].each do |region|
          @country_regions << CountryRegion.parse_region(region)
        end
      elsif  regions[:region] && regions.is_a?(Hash)
        @country_regions << CountryRegion.parse_region(regions[:region])
      end
    end
  end
end