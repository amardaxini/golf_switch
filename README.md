# GolfSwitch

Ruby Wrapper of golf switch api

## Installation

Add this line to your application's Gemfile:

    gem 'golf_switch'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install golf_switch

## Usage

### Configure Golf Switch

    GolfSwitch.configure do |config|
      config.reseller_id="GHE"
      config.partner_id=""
      config.source_cd="A"
      config.lang=""
      config.user_ip="120.62.168.214"
      config.user_session_id=""
      config.access_key=""
      config.gs_source=""
    end



### Area API
    # parameter country_id,region_id (optional)

      area = GolfSwitch::Area.new({:country_id=>"USA"})
      area.commit #fire API request

    # API Response
      area.response

    # Error
      area.error?

    # return [] or Array of counties with name and it's id
    # each country has array of regions with name and it's id
    # each region has array of areas with name and it's id
    # Country: [Country(area_id,name,country_regions=[Regions])
    # Region:[CountryRegion(area_id,name,region_areas=[Area])
    # Area: [RegionArea(area_id,name)

      area.parse_response #store result in area.api_response

    # get all countries
     area.api_response

    # Country region
      country.regions

    # Region Area
      region.areas



### Reference

[Golf Switch API Reference ](https://devxml.golfswitch.com/golfservice.asmx)

[WSDL](https://devxml.golfswitch.com/golfservice.asmx?WSDL)

[Example Defination](https://devxml.golfswitch.com/examples/definitions.htm)
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
