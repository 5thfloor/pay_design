require "pay_design/version"
require "pay_design/payment_info"

require 'http'

module PayDesign
  def self.encode_to_sjis(str)
    # Perhaps this should make sure the original encoding is UTF8.
    str ? str.encode(Encoding::SHIFT_JIS) : nil
  end

  module Endpoint
    LINK_STYLE_URL   = "https://www.paydesign.jp/settle/settle3/bp3.dll"
    SERVER_STYLE_URL = "https://www.paydesign.jp/settle/settle2/ubp3.dll"
  end

  module Callbacks
    def request_payment(params)
      {
        deal_id: params["SID"],
        remarks: params["FUKA"],
      }
    end
  end

  class ConvenienceStore
    def initialize(ip_code)
      @ip = ip_code
    end

    def store_type
      99
    end

    def request_payment(payment_info)
      # TODO: Server-style payment request
      params = payment_info.data.merge(IP: @ip, STORE: store_type)
      HTTP.post(Endpoint::SERVER_STYLE_URL, form: params)
    end

    def request_payment_url(payment_info)
      params = payment_info.data.merge(IP: @ip, STORE: 99)
      uri = URI(Endpoint::LINK_STYLE_URL)
      uri.query = params.map{|k,v| [k, (v.is_a?(String) ? URI.escape(v) : v)].join("=")}.join("&")
      uri.to_s
    end
  end

  def self.ping
    payment_info = PayDesign::PaymentInfo.new(deal_id: "123456789ABCDEF",
                                              sur_name: "森下詩織",
                                              first_name: "　",
                                              tel: "00000000000",
                                              email: "develop@tnzk.org",
                                              item_name_1: "puchioko for you",
                                              item_price_1: 8_000,
                                             )
    conveni = PayDesign::ConvenienceStore.new(ENV["PAYDESIGN_IPCODE"])
    res = conveni.request_payment_url(payment_info)
  end

  class Loppi < ConvenienceStore
    def store_type
      1
    end
  end
  class Seven < ConvenienceStore
    def store_type
      2
    end
  end
  class Famima < ConvenienceStore
    def store_type
      3
    end
  end
end
