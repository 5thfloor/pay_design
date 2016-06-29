require 'spec_helper'

describe PayDesign::ConvenienceStore::Callbacks do
  describe '.payment_registered' do
    let (:params) { { "SID" => "0123456789ABCDEF", "FUKA" => "深谷".encode(Encoding::SHIFT_JIS) } }
    it 'maps their parametes to a hash with more meaningful fields' do
      registered_payment = PayDesign::ConvenienceStore::Callbacks.payment_registered(params)
      expect(registered_payment[:deal_id]).to eq("0123456789ABCDEF")
      expect(registered_payment[:remarks]).to eq("深谷")
    end
  end
end
