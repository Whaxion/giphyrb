require_relative 'gif'
require_relative 'user'

module GiphyRB

  module Parts

    class ChildPack

      attr_reader :type, :id, :parent, :type, :content_type, :slug, :display_name, :short_display_name, :description, :banner_image, :has_children, :user, :featured_gif

      def initialize(arr)
        @arr = arr
        @id = arr['id'] unless arr['id'] == nil
        @parent = arr['parent'] unless arr['parent'] == nil
        @type = arr['type'] unless arr['type'] == nil
        @content_type = arr['content_type'] unless arr['content_type'] == nil
        @slug = arr['slug'] unless arr['slug'] == nil
        @display_name = arr['display_name'] unless arr['display_name'] == nil
        @short_display_name = arr['short_display_name'] unless arr['short_display_name'] == nil
        @description = arr['description'] unless arr['description'] == nil
        @banner_image = arr['banner_image'] unless arr['banner_image'] == nil
        @has_children = arr['has_children'] unless arr['has_children'] == nil
        @user = User.new(arr['user']) unless arr['user'] == nil
        @featured_gif = Gif.new(arr['featured_gif']) unless arr['featured_gif'] == nil
      end

    end

  end
end