require_relative 'image'
require_relative 'user'

module GiphyRB

  module Parts

    class Gif

      attr_reader :type, :id, :slug, :url, :bitly_url, :embed_url, :username, :source, :rating, :content_url, :user, :source_tld, :source_post_url, :update_datetime, :import_datetime, :create_datetime, :trending_datetime, :title, :images

      def initialize(arr)
        @arr = arr
        @type = arr['type'] unless arr['type'] == nil
        @id = arr['id'] unless arr['id'] == nil
        @slug = arr['slug'] unless arr['slug'] == nil
        @url = arr['url'] unless arr['url'] == nil
        @bitly_url = arr['bitly_url'] unless arr['bitly_url'] == nil
        @embed_url = arr['embed_url'] unless arr['embed_url'] == nil
        @username = arr['username'] unless arr['username'] == nil
        @source = arr['source'] unless arr['source'] == nil
        @rating = arr['rating'] unless arr['rating'] == nil
        @content_url = arr['content_url'] unless arr['content_url'] == nil
        @user = User.new(arr['user']) unless arr['user'] == nil
        @source_tld = arr['source_tld'] unless arr['source_tld'] == nil
        @source_post_url = arr['source_post_url'] unless arr['source_post_url'] == nil
        @update_datetime = arr['update_datetime'] unless arr['update_datetime'] == nil
        @import_datetime = arr['import_datetime'] unless arr['import_datetime'] == nil
        @create_datetime = arr['create_datetime'] unless arr['create_datetime'] == nil
        @trending_datetime = arr['trending_datetime'] unless arr['trending_datetime'] == nil
        @title = arr['title'] unless arr['title'] == nil
        @images = parse_images(arr['images']) unless arr['images'] == nil
      end

      private

      def parse_images(arr)
        images = {}
        arr.each do |name, data|
          images[name.to_s] = Image.new(name, data)
        end
        images
      end

    end

  end
end