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
course_info = GolfSwitch::CourseInfo.new("18633")
course_info.commit
course_info.parse_response
course_info.api_response