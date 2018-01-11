module GiphyRB

  module Parts

    class Tag

      attr_reader :tag, :rank

      def initialize(arr)
        @arr = arr
        @tag = arr['tag'] unless arr['tag'] == nil
        @rank = arr['rank'] unless arr['rank'] == nil
      end

    end

  end
end