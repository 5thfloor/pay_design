module PayDesign
  module ConvenienceStore
    class Payment
      def initialize(ip_code)
        @ip = ip_code
      end

      def request_url(payment_info)
        params = payment_info.data.merge(IP: @ip, STORE: 99)
        uri = URI(Endpoint::LINK_STYLE_URL)
        uri.query = params.map{|k,v| [k, (v.is_a?(String) ? URI.escape(v) : v)].join("=")}.join("&")
        uri.to_s
      end
    end
  end
end
