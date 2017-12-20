module GiphyRB

  module Parts

    class User

      attr_reader :avatar_url, :banner_url, :profile_url, :username, :display_name, :twitter

      def initialize(arr)
        @arr = arr
        @avatar_url = arr['avatar_url'] unless arr['avatar_url'] == nil
        @banner_url = arr['banner_url'] unless arr['banner_url'] == nil
        @profile_url = arr['profile_url'] unless arr['profile_url'] == nil
        @username = arr['username'] unless arr['username'] == nil
        @display_name = arr['display_name'] unless arr['display_name'] == nil
        @twitter = arr['twitter'] unless arr['twitter'] == nil
      end

    end

  end
end