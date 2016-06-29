require 'spec_helper'

describe PayDesign::ConvenienceStore do
  it 'does something useful' do
    payment_info = PayDesign::PaymentInfo.new(SID: "123456789ABCDEF",
                                              NAME1: "You are the Tourist",
                                              NAME2: "　",
                                              TEL: "00000000000",
                                              MAIL: "develop@tnzk.org",
                                              N1: "puchioko for you",
                                              K1: 8_000,
                                             )
    conveni = PayDesign::Famima.new("**REMOVED**")
    res = conveni.request_payment(payment_info)
    puts res.body.to_s.force_encoding("sjis").encode(Encoding::UTF_8, :invalid => :replace, :undef => :replace)
  end
end
