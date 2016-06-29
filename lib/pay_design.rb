require "pay_design/version"
require "pay_design/payment_info"
require 'pay_design/convenience_store'
require 'pay_design/convenience_store/payment'
require 'pay_design/convenience_store/callbacks'

module PayDesign
  def self.encode_to_sjis(str)
    # Perhaps this should make sure the original encoding is UTF8.
    str ? str.encode(Encoding::SHIFT_JIS) : nil
  end

  def self.encode_to_utf8(str)
    # Perhaps this should make sure the original encoding is Shift_JIS.
    str ? str.encode(Encoding::UTF_8) : nil
  end
end
