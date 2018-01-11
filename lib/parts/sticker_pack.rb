require_relative 'gif'
require_relative 'user'
require_relative 'tag'
require_relative 'ancestor'

module GiphyRB

  module Parts

    class StickerPack

      attr_reader :type, :id, :type, :content_type, :slug, :display_name, :short_display_name, :description, :banner_image, :has_children, :user, :featured_gif

      def initialize(arr)
        @arr = arr
        @id = arr['id'] unless arr['id'] == nil
        @display_name = arr['display_name'] unless arr['display_name'] == nil
        @slug = arr['slug'] unless arr['slug'] == nil
        @content_type = arr['content_type'] unless arr['content_type'] == nil
        @short_display_name = arr['short_display_name'] unless arr['short_display_name'] == nil
        @description = arr['description'] unless arr['description'] == nil
        @banner_image = arr['banner_image'] unless arr['banner_image'] == nil
        @has_children = arr['has_children'] unless arr['has_children'] == nil
        @user = User.new(arr['user']) unless arr['user'] == nil
        @featured_gif = Gif.new(arr['featured_gif']) unless arr['featured_gif'] == nil
        @tags = parse_tags(arr['tags']) unless arr['tags'] == nil
      end

      private

      def parse_tags(arr)
        tags = []
        arr.each do |tag|
          tags[] = Tag.new(tag)
        end
        tags
      end

      def parse_ancestors(arr)
        ancestors = []
        arr.each do |tag|
          ancestors[] = Ancestor.new(tag)
        end
        ancestors
      end

    end

  end
end