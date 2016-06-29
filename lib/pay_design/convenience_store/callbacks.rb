module PayDesign
  module ConvenienceStore
    module Callbacks
      # Whilst they are named "Callbacks", they will just format parameters.
      # How actual HTTP-level behaves depends on what the library user is.

      def self.payment_registered(params)
        {
          deal_id: params["SID"],
          remarks: PayDesign.encode_to_utf8(params["FUKA"]),
        }
      end

      def self.payment_cancelled
        # TODO: Nothing to do.
      end

      def self.payment_completed(params)
        datetime_string = params["DATE"] + " " + params["TIME"]
        {
          notification_id: params["SEQ"],
          paid_at:         DateTime.parse(datetime_string),
          ip_code:         params["IP"],
          deal_id:         params["SID"],
          amount:          params["KINGAKU"],
          store_type:      params["CVS"],
          store_code:      params["SCODE"],
          remarks:         PayDesign.encode_to_utf8(params["FUKA"]),
        }
      end

      def self.payment_cancelled(params)
        {
          notification_id: params["SEQ"],
          cancel_date:     Date.parse(params["DATE"]),
          ip_code:         params["IP"],
          deal_id:         params["SID"],
          amount:          params["KINGAKU"],
          remarks:         PayDesign.encode_to_utf8(params["FUKA"]),
        }
      end
    end
  end
end
