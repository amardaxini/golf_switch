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
area1 = GolfSwitch::Area.new({:country_id=>"USA",:region_id=>"IL"})
area1.commit
area1.parse_response
area1.api_response
