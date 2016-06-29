module PayDesign
  module ConvenienceStore
    module Callbacks
      def request_payment(params)
        {
          deal_id: params["SID"],
          remarks: params["FUKA"],
        }
      end
    end
  end
end
