module GiphyRB

  module Parts

    class Meta

      attr_reader :msg, :status, :response_id

      def initialize(arr)
        @arr = arr
        @msg = arr['msg'] unless arr['msg'] == nil
        @status = arr['status'] unless arr['status'] == nil
        @response_id = arr['response_id'] unless arr['response_id'] == nil
      end

    end

  end
end