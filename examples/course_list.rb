require_relative "./../lib/golf_switch"
GolfSwitch.configure do |config|
  config.reseller_id="GHE"
  config.partner_id=""
  config.source_cd="A"
  config.lang=""
  config.user_ip="120.62.167.249"
  config.user_session_id="some_session"
  config.access_key="some_access_key"
  config.gs_source=""
end
course_list = GolfSwitch::CourseList.new({:country_id=>"USA",:region_id=>"WI",:area=>"Northern Wisconsin"})
course_list.commit
course_list.parse_response
course_list.api_response