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
avail_list = GolfSwitch::CourseAvailList.new({:country_id=>"USA",:region_id=>"IL",:play_beg_date=>Date.today.strftime("%Y-%m-%d"),:play_end_date=>Date.today.strftime("%Y-%m-%d")})
avail_list.commit
avail_list.parse_response
binding.pry
avail_list