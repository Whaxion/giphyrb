require_relative 'parts/sticker_pack'
require_relative 'parts/meta'
require_relative 'parts/pagination'

module GiphyRB

  module Responses

    class StickerPack

      attr_reader :status, :gifs, :meta, :pagination

      def initialize(arr)
        @arr = arr
        @status = 500
        unless arr == nil
          @meta = Parts::Meta.new(arr['meta']) unless arr['meta'] == nil
          @pagination = Parts::Pagination.new(arr['pagination']) unless arr['pagination'] == nil
          @status = @meta.status unless @meta == nil
          generate arr['data'] unless arr['data'] == nil
        end
      end

      def generate(stickers)
        stickers = [].push(stickers) unless stickers == nil
        @sticker_pack = []
        stickers.each do |sticker|
          @sticker_pack.push Parts::StickerPack.new(sticker)
        end
        @sticker_pack
      end

    end

  end
end