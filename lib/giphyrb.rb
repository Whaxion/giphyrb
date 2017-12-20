require 'net/http'
require 'uri'
require 'json'
require_relative 'responses/search'
require_relative 'responses/trending'
require_relative 'responses/translate'
require_relative 'responses/random'

module GiphyRB
  class Giphy

    ENDPOINT = 'http://api.giphy.com'
    API_VERSION = 'v1'

    def initialize(api_key:true)
      @api_key = api_key
    end

    def search(query, limit=5, offset=0, rating='g', lang=nil)
      params = {:q => query, :limit => limit.to_i, :offset => offset.to_i, :rating => rating}
      params[:lang] = lang unless lang == nil
      result = request'gifs/search', params
      Responses::Search.new(result, query)
    end

    def trending(limit=5, offset=0, rating='g')
      params = {:limit => limit.to_i, :offset => offset.to_i, :rating => rating}
      result = request'gifs/trending', params
      Responses::Trending.new(result)
    end

    def translate(string)
      params = {:s => string}
      result = request'gifs/translate', params
      Responses::Trending.new(result)
    end

    def random(tag=nil, rating='g')
      params = {:tag => tag, :rating => rating}
      result = request'gifs/random', params
      Responses::Random.new(result, tag)
    end

    def from_id(id)
      params = {}
      result = request'gifs/' + id.to_s, params
      Response.new(result)
    end

    def from_ids(ids=[])
      ids = Array(ids)
      ids = ids.join ','
      params = {:ids => ids}
      result = request'gifs/', params
      Response.new(result)
    end

    private

      def request(url, params)
        params[:api_key] = @api_key
        params[:fmt] = 'json'
        uri = URI "#{ENDPOINT}/#{API_VERSION}/#{url}"
        uri.query = URI.encode_www_form(params)
        resp = Net::HTTP.get_response(uri)
        result = nil
        if resp.is_a?(Net::HTTPSuccess) || resp.is_a?(Net::HTTPNotFound) || resp.is_a?(Net::HTTPBadRequest) || resp.is_a?(Net::HTTPForbidden) || resp.is_a?(Net::HTTPTooManyRequests)
          result = JSON.parse(resp.body)
        end
        result
      end
  end
end