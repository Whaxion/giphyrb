module GiphyRB

  module Parts

    class Pagination

      attr_reader :offset, :total_count, :count

      def initialize(arr)
        @arr = arr
        @offset = arr['offset'] unless arr['offset'] == nil
        @total_count = arr['total_count'] unless arr['total_count'] == nil
        @count = arr['count'] unless arr['count'] == nil
      end

    end

  end
end