require_relative '../response'

module GiphyRB

  module Responses

    class Random < Response

      attr_reader :tag

      def initialize(arr, tag)
        @tag = tag
        super arr
      end

    end

  end
end