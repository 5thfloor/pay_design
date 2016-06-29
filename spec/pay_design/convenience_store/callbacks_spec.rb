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

  describe '.payment_completed' do
    let (:params) {
      {
        "SEQ"     => "123456789",
        "DATE"    => "20151211",
        "TIME"    => "183059",
        "IP"      => "D012345678",
        "SID"     => "0123456789ABCDEF",
        "KINGAKU" => "20000",
        "CVS"     => "loppi",
        "SCODE"   => "\n",
        "FUKA"    => "深谷".encode(Encoding::SHIFT_JIS)
      }
    }
    it 'maps their parametes to a hash with more meaningful fields' do
      completed_payment = PayDesign::ConvenienceStore::Callbacks.payment_completed(params)
      expect(completed_payment[:deal_id]).to eq("0123456789ABCDEF")
      expect(completed_payment[:remarks]).to eq("深谷")
    end
    it 'maps its date and time fields to single datetime field' do
      completed_payment = PayDesign::ConvenienceStore::Callbacks.payment_completed(params)
      expect(completed_payment[:paid_at].class).to eq(DateTime)
    end
  end

  describe '.payment_cancelled' do
    let (:params) {
      {
        "SEQ"     => "123456789",
        "DATE"    => "20151211",
        "IP"      => "D012345678",
        "SID"     => "0123456789ABCDEF",
        "KINGAKU" => "20000",
        "FUKA"    => "深谷".encode(Encoding::SHIFT_JIS)
      }
    }
    it 'maps their parametes to a hash with more meaningful fields' do
      completed_payment = PayDesign::ConvenienceStore::Callbacks.payment_cancelled(params)
      expect(completed_payment[:deal_id]).to eq("0123456789ABCDEF")
      expect(completed_payment[:remarks]).to eq("深谷")
    end
    it 'maps its date and time fields to single datetime field' do
      completed_payment = PayDesign::ConvenienceStore::Callbacks.payment_cancelled(params)
      expect(completed_payment[:cancel_date].class).to eq(Date)
    end
  end
end
