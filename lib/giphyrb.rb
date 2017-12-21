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
    VERSION = '0.1.1'

    # Initialize the client
    def initialize(api_key:true)
      @api_key = api_key
    end

    # Search all GIPHY GIFs for a word or phrase. Punctuation will be stripped and ignored. Use a plus or url encode for phrases.
    # == Arguments
    # +query+:: Search query term or phrase
    # +limit+:: The maximum number of records to return (default=5)
    # +offset+:: An optional results offset. (default=0)
    # +rating+:: Filters results by specified rating (default=g)
    # +lang+:: Specify default language for regional content; use a 2-letter ISO 639-1 language code (default=nil)
    # == Return
    # Responses::Search
    def search(query, limit=5, offset=0, rating='g', lang=nil)
      params = {:q => query, :limit => limit.to_i, :offset => offset.to_i, :rating => rating}
      params[:lang] = lang unless lang == nil
      result = request'gifs/search', params
      Responses::Search.new(result, query)
    end

    # Fetch GIFs currently trending online. Hand curated by the GIPHY editorial team. The data returned mirrors the GIFs showcased on the GIPHY homepage.
    # == Arguments
    # +limit+:: The maximum number of records to return (default=5)
    # +offset+:: An optional results offset. (default=0)
    # +rating+:: Filters results by specified rating (default=g)
    # == Return
    # Responses::Trending
    def trending(limit=5, offset=0, rating='g')
      params = {:limit => limit.to_i, :offset => offset.to_i, :rating => rating}
      result = request'gifs/trending', params
      Responses::Trending.new(result)
    end

    # The translate API draws on search, but uses the GIPHY special sauce to handle translating from one vocabulary to another. In this case, words and phrases to GIFs.
    # == Arguments
    # +string+:: Search term
    # == Return
    # Responses::Translate
    def translate(string)
      params = {:s => string}
      result = request'gifs/translate', params
      Responses::Translate.new(result)
    end

    # Returns a random GIF, limited by tag. Excluding the tag parameter will return a random GIF from the GIPHY catalog.
    # == Arguments
    # +tag+:: Filters results by specified tag
    # +rating+:: Filters results by specified rating (default=g)
    # == Return
    # Responses::Random
    def random(tag=nil, rating='g')
      params = {:tag => tag, :rating => rating}
      result = request'gifs/random', params
      Responses::Random.new(result, tag)
    end

    # Returns a GIF given that GIF's unique ID.
    # == Arguments
    # +id+:: Filters results by specified GIF ID
    # == Return
    # Response
    def from_id(id)
      params = {}
      result = request'gifs/' + id.to_s, params
      Response.new(result)
    end

    # A multiget version of the get GIF by ID endpoint
    # == Arguments
    # +ids+:: Filters results by specified GIF IDs (Array)
    # == Return
    # Response
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