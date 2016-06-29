require 'spec_helper'

describe PayDesign::ConvenienceStore::Payment do
  describe '#request_url' do
    subject { conveni_payment.request_url(payment_info) }
    let (:conveni_payment) { PayDesign::ConvenienceStore::Payment.new("D012345678") }
    let (:payment_info) { PayDesign::PaymentInfo.new(surname: "注文者の名前") }
    it { is_expected.to include("D12345678") }
  end
end
