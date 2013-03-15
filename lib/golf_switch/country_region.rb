module GolfSwitch
  class CountryRegion < AreaResponse
    attr_accessor :region_areas
    def initialize(area_id=nil,name=nil)
      super(area_id,name)
      @region_areas = []
    end

    def self.parse_region(region)
      golfswitch_region = CountryRegion.new(region[:id],region[:nm])
      golfswitch_region.parse_region_areas(region[:areas])
      golfswitch_region
    end

    def areas
      @region_areas
    end

    def parse_region_areas(areas)
       if areas[:area] && areas[:area].is_a?(Array)
        areas[:area].each do |area|
          @region_areas << RegionArea.parse_region_area(area)
        end
      elsif  areas[:area] && areas[:area].is_a?(Hash)
        @region_areas << RegionArea.parse_region_area(areas[:area])
      end
    end
  end
end