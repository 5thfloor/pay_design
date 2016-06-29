$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'pay_design'
require 'webmock/rspec'
WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  config.before(:each) do
    stub_request(:post, "https://www.paydesign.jp/settle/settle2/ubp3.dll").
      with(
        body: {
          "IP"    => "**REMOVED**",
          "K1"    => "8000",
          "MAIL"  => "develop@tnzk.org",
          "N1"    => "puchioko for you",
          "NAME1" => "You are the Tourist",
          "NAME2" => "\x81@",
          "SID"   => "123456789ABCDEF",
          "STORE" => "3",
          "TEL"   => "00000000000"},
      ).
      to_return(:status => 200, :body => "", :headers => {})
  end
end
