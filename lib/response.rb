require_relative 'parts/gif'
require_relative 'parts/meta'
require_relative 'parts/pagination'

module GiphyRB

  class Response

    attr_reader :status, :gifs, :meta, :pagination

    def initialize(arr)
      @arr = arr
      @status = 500
      unless arr == nil
        @meta = Parts::Meta.new(arr['meta']) unless arr['meta'] == nil
        @pagination = Parts::Pagination.new(arr['pagination']) unless arr['pagination'] == nil
        @status = @meta.status unless @meta == nil
        generate_gifs arr['data'] unless arr['data'] == nil
      end
    end

    def generate_gifs(gifs)
      gifs = [].push(gifs) unless gifs.class == Array
      @gifs = []
      gifs.each do |gif|
        @gifs.push Parts::Gif.new(gif)
      end
      @gifs
    end

  end
end