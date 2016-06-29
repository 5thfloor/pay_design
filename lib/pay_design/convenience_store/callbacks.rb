module PayDesign
  module ConvenienceStore
    module Callbacks
      def self.payment_registered(params)
        {
          deal_id: params["SID"],
          remarks: PayDesign.encode_to_utf8(params["FUKA"]),
        }
      end
    end
  end
end
