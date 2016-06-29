require "pay_design/version"
require "pay_design/payment_info"
require 'pay_design/convenience_store'
require 'pay_design/convenience_store/payment'

module PayDesign
  def self.encode_to_sjis(str)
    # Perhaps this should make sure the original encoding is UTF8.
    str ? str.encode(Encoding::SHIFT_JIS) : nil
  end
end
