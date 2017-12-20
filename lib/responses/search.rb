require_relative '../response'

module GiphyRB

  module Responses

    class Search < Response

      attr_reader :query

      def initialize(arr, query)
        @query = query
        super arr
      end

    end

  end
end