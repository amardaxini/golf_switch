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



### [Area API](https://devxml.golfswitch.com/examples/definitions.htm#areas)
    # parameter country_id,region_id (optional)

      area = GolfSwitch::Area.new({:country_id=>"USA"})
      area.commit # Fire API request
      area.response # API RAW Response
      area.error?  # API Error?
      area.error_message # API Error message

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

### [Course List API](https://devxml.golfswitch.com/examples/definitions.htm#courselist)
    # option attributes
    # country_id,region_id,area,latitude,longitude,postal_code,
    # max_distance,max_distance_type,show_all_status,show_dis_connected
    # featured_only,:sort

    option_attributes = {:country_id=>"USA"}
    course_list = GolfSwitch::CourseList.new(option_attributes)
    course_list.commit # Fire APi Request
    course_list.response # API RAW Response
    course_list.error_message # API Error message

    # return [] or Array of courses with course info
    course_list.parse_response

     course_list.api_response # parsed response


### [Course Avail List API](https://devxml.golfswitch.com/examples/definitions.htm#courseavaillist)
    # option attributes
    # country_id,region_id,area,play_beg_date,play_end_date,
    # time,players,alt_rate_type,promo_code,latitude,
    #longitude,postal_code,max_distance,max_distance_type,
    # show_all_times,show_if_no_times....

    option_attributes = {:country_id=>"USA"}
    course_list = GolfSwitch::CourseAvailList.new(option_attributes)
    course_list.commit # Fire APi Request
    course_list.response # API RAW Response
    course_list.error_message # API Error message

    # return [] or Array of courses with course info
    # and dates and time with payment details

    course_list.parse_response
    course_list.api_response # parsed response

### [Course Info API](https://devxml.golfswitch.com/examples/definitions.htm#courseinfo)
    course_id = "14002"
    course = GolfSwitch::CourseInfo.new(course_id)
    course.commit # Fire APi Request
    course.response # API RAW Response
    course.error_message # API Error message

    # return course info with hole,images,score card and other detail

    course_list.parse_response
    course_list.api_response # parsed response



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
