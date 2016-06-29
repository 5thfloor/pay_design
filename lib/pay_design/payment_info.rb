module PayDesign
  class PaymentInfo
    # TODO:
    #   Validates fields.
    attr_reader :data
    def initialize(data)
      @data = {
        SID:    data[:deal_id],
        NAME1:  PayDesign.encode_to_sjis(data[:sur_name]),
        NAME2:  PayDesign.encode_to_sjis(data[:first_name]),
        KANA1:  PayDesign.encode_to_sjis(data[:sur_name_kana]),
        KANA2:  PayDesign.encode_to_sjis(data[:first_name_kana]),
        YUBIN1: data[:postal_code_former],
        YUBIN2: data[:postal_code_latter],
        TEL:    data[:tel],
        ADR1:   PayDesign.encode_to_sjis(data[:address_former]),
        ADR2:   PayDesign.encode_to_sjis(data[:address_latter]),
        MAIL:   data[:email],
        FUKA:   data[:remarks],
        N1:     PayDesign.encode_to_sjis(data[:item_name_1]),
        K1:     data[:item_price_1],
        N2:     PayDesign.encode_to_sjis(data[:item_name_2]),
        K2:     data[:item_price_2],
        N3:     PayDesign.encode_to_sjis(data[:item_name_3]),
        K3:     data[:item_price_3],
        N4:     PayDesign.encode_to_sjis(data[:item_name_4]),
        K4:     data[:item_price_4],
        N5:     PayDesign.encode_to_sjis(data[:item_name_5]),
        K5:     data[:item_price_5],
        N6:     PayDesign.encode_to_sjis(data[:item_name_6]),
        K6:     data[:item_price_6],
        STORE:  data[:store_type],
        KIGEN:  PaymentInfo.date_to_yyyymmdd(data[:expires_at]),
        TAX:    data[:tax],
        OKURL:  data[:successfull_callback_url],
        RT:     data[:cancelling_callback_url],
      }.delete_if {|_,v| v.nil? }
    end

    private

    def self.date_to_yyyymmdd(date_or_yyyymmdd)
      case date_or_yyyymmdd
      when Date
        date_or_yyyymmdd.strftime("%Y%m%d")
      when String
        date_or_yyyymmdd # Trusting given string is in relevant format.
      end
    end
  end
end
