module GolfSwitch
  class RegionArea < AreaResponse
    def initialize(area_id=nil,name=nil)
      super(area_id,name)
      @region_areas = []
    end

    def self.parse_region_area(area)
      golfswitch_area = RegionArea.new(area[:id],area[:nm])
      golfswitch_area
    end
  end
end