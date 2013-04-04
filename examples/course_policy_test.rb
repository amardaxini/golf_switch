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
course_policy = GolfSwitch::GetCoursePolicy.new({:course_id=>14002,:play_date=>Date.today.strftime("%Y-%m-%d")})
course_policy.commit
course_policy.parse_response
binding.pry
