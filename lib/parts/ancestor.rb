module GiphyRB

  module Parts

    class Ancestor

      attr_reader :id, :slug, :display_name, :short_display_name, :featured_gif_id, :parent, :has_children, :banner_image

      def initialize(arr)
        @arr = arr
        @id = arr['id'] unless arr['id'] == nil
        @slug = arr['slug'] unless arr['slug'] == nil
        @display_name = arr['display_name'] unless arr['display_name'] == nil
        @short_display_name = arr['short_display_name'] unless arr['short_display_name'] == nil
        @featured_gif_id = arr['featured_gif_id'] unless arr['featured_gif_id'] == nil
        @parent = arr['parent'] unless arr['parent'] == nil
        @has_children = arr['has_children'] unless arr['has_children'] == nil
        @banner_image = arr['banner_image'] unless arr['banner_image'] == nil
      end

    end

  end
end