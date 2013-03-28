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
avail_list = GolfSwitch::CourseAvail.new({:course_id=>"14002",:play_beg_date=>Date.today.strftime("%Y-%m-%d"),:play_end_date=>Date.today.strftime("%Y-%m-%d")})
avail_list.commit
avail_list.parse_response
binding.pry
avail_list
# avail_lists = GolfSwitch::CourseAvailRequest.new()
# avail_list1 = GolfSwitch::CourseAvail.new({:course_id=>"14003",:play_beg_date=>Date.today.strftime("%Y-%m-%d"),:play_end_date=>Date.today.strftime("%Y-%m-%d")})
# avail_lists.course_avails << avail_list
# avail_lists.course_avails << avail_list1

# avail_lists.commit
# avail_lists.parse_response
# binding.pry
# avail_lists