module GiphyRB

  module Parts

    class Image

      attr_reader :name, :url, :width, :height, :size,:mp4, :mp4_size, :webp, :webp_size

      def initialize(name, arr)
        @name = name
        @arr = arr
        @url = arr['url']
        @width = arr['width']
        @height = arr['height']
        @size = arr['size'] unless arr['size'] == nil
        @mp4 = arr['mp4'] unless arr['mp4'] == nil
        @mp4_size = arr['mp4_size'] unless arr['mp4_size'] == nil
        @webp = arr['webp'] unless arr['webp'] == nil
        @webp_size = arr['webp_size'] unless arr['webp_size'] == nil
        @frames = arr['frames'] unless arr['frames'] == nil
      end

    end

  end
end