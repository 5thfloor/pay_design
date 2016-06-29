require 'spec_helper'

describe PayDesign::PaymentInfo do
  describe '.new' do
    it 'encodes Japanese letters in Shift_JIS assuming it originally is UTF-8' do
      name_in_utf8 = "ボン・イヴェール"
      name_in_sjis = name_in_utf8.encode(Encoding::SHIFT_JIS)
      params = { sur_name: name_in_utf8}
      payment_info = PayDesign::PaymentInfo.new(params)
      expect(payment_info.data[:NAME1]).to eq(name_in_sjis)
    end

    it 'formats expire date to string in YYYYMMDD-style' do
      params = { expires_at: Date.today }
      payment_info = PayDesign::PaymentInfo.new(params)
      expect(payment_info.data[:KIGEN].class).to eq(String)
      expect(payment_info.data[:KIGEN].size).to eq(8)
    end

    it 'accepts expire date in YYYYMMDD-string without any conversion' do
      params = { expires_at: "90160629" }
      payment_info = PayDesign::PaymentInfo.new(params)
      expect(payment_info.data[:KIGEN].class).to eq(String)
      expect(payment_info.data[:KIGEN].size).to eq(8)
      expect(payment_info.data[:KIGEN]).to eq("90160629")
    end
  end
end
