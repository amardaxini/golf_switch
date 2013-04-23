require_relative "./../lib/golf_switch"
GolfSwitch.configure do |config|
  config.reseller_id="GHE"
  config.partner_id=""
  config.source_cd="A"
  config.lang=""
  config.user_ip="120.62.161.103"
  config.user_session_id="some_session"
  config.access_key="some_access_key"
  config.gs_source=""

end
# GolfSwitch.configuration.golf_switch_wsdl = "https://xml.golfswitch.com/golfService.asmx?WSDL"

avail_list = GolfSwitch::CourseAvailList.new({:country_id=>"USA",:region_id=>"CO",:play_beg_date=>Date.today.strftime("%Y-%m-%d"),:play_end_date=>Date.today.strftime("%Y-%m-%d"),:time=>"1009",:barter_only=>true})
avail_list.commit
avail_list.parse_response
avail_list.api_response
avail_list1 = GolfSwitch::CourseAvailList.new({:country_id=>"USA",:region_id=>"CA",:play_beg_date=>Date.today.strftime("%Y-%m-%d"),:play_end_date=>Date.today.strftime("%Y-%m-%d"),:show_all_times=>true,:time=>"1009"})
avail_list1.commit
avail_list1.parse_response
avail_list1.api_response

avail_list2 = GolfSwitch::CourseAvailList.new({:country_id=>"USA",:region_id=>"CA",:play_beg_date=>Date.today.strftime("%Y-%m-%d"),:play_end_date=>Date.today.strftime("%Y-%m-%d"),:show_all_times=>true,:time=>"1009",:latitude=>"36.778261",:longitude=>"-119.4179324",:max_distance=>1000})
avail_list2.commit
avail_list2.parse_response
avail_list2.api_response


hot_deals  = GolfSwitch::CourseAvailList.new({:country_id=>"USA",:region_id=>"CA",:play_beg_date=>Date.today.strftime("%Y-%m-%d"),:play_end_date=>Date.today.strftime("%Y-%m-%d"),:show_all_times=>true,:time=>"1009",:barter_only=>true})
hot_deals.commit
hot_deals.parse_response
hot_deals.api_response