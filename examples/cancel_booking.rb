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

player_attributes= {
  :first_name=>"Amar",
  :last_name=>"Daxini",
  :email=>"amardaxini@gmail.com",
  :phone=>"0000000000",
  :city=>"New York",
  :state=>"NY",
  :country=>"US",
  :postal_code=>"10015"
}
player1 = GolfSwitch::Player.new(player_attributes)
# player2 = GolfSwitch::Player.new(player_attributes)
# player3 = GolfSwitch::Player.new(player_attributes)
# player4 = GolfSwitch::Player.new(player_attributes)
payment_attributes = {
  :pay_type=>"CC",
  :cc_type=>"VI",
  :pay_number=>"4321432143214327",
  :cc_exp_mo=>"11",
  :cc_exp_yr=>"2014",
  :cc_name=>"Amar Daxini",
  :cc_address1=>"153 State Park Rd",
  :cc_city=>"New York",
  :cc_state=>"NY",
  :cc_country=>"US",
  :cc_postal_code=>"10015",
  :pay_amount=>"400.00",
  :pay_curr=>"USD"
}
payment = GolfSwitch::Payment.new(payment_attributes)

book_golf_item_attributes= {
  :course_id=>"14002",
  :play_date=>"2013-04-20",
  :play_time=>"0725",
  :num_players=>"4",
  :pp_price=>"100.00",
  :curr=>"USD",
  :pp_charge=>"100.00",
  :pp_txn_fee=>"2.00",
  :chrg_curr=>"USD",
  :pp_non_ref=>"2.00",
  :pp_net_rt=>"80.0000",
  :tot_price=>"400.00",
  :tot_txn_fee=>"8.00",
  :tot_charge=>"400.00",
  :tot_non_ref=>"8.00",
  :tot_net_rt=>"320.00",
  :flags=>nil,
  :players=>[player1],
  :payment=>payment,
  :ignore_pricing=>true
}

book_golf_item = GolfSwitch::BookGolfItem.new(book_golf_item_attributes)

book_golf = GolfSwitch::BookGolf.new()
book_golf.book_golf_items << book_golf_item
#
book_golf.commit

book_golf.parse_response
res = book_golf.api_response[0]
cancel_book = GolfSwitch::CancelGolf.new("14002","2013-04-20",res.confirmation_no,res.booking_id)
cancel_book.commit
cancel_book.parse_response
