module WhatsGonnaHappen
  module Score
    class UserScore
      include Entity

      def initialize(id)
        @id = id
        @user_picks = {}
        @user_scores = {}
      end

      def add_user(user_id)
        return if @user_scores.has_key?(user_id)
      end

      def make_prediction(user_id, prediction_id, option, bet)
      end
    end
  end
end
