require_relative "./../lib/golf_switch"
GolfSwitch.configure do |config|
  config.reseller_id="GHE"
  config.partner_id=""
  config.source_cd="A"
  config.lang=""
  config.user_ip="120.62.168.214"
  config.user_session_id="some_session"
  config.access_key="some_access_key"
  config.gs_source=""
end
area1 = GolfSwitch::Area.new({:country_id=>"USA"})
area1.commit
area1.parse_response
area1