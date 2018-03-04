module WhatsGonnaHappen
  module Picks
    class UserPicks
      include Entity

      def initialize(id)
        @id = id
      end

      def create(user_id, title, description)
      end

      def add_prediction_template(template)
      end

      def add_pick_option(pick_option)
      end
    end
  end
end
