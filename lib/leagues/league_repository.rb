module WhatsGonnaHappen
  module Leagues
    class LeagueRepository
      def initialize(event_store)
        @event_store = event_store
      end

      def get(id)
        league_events = @event_store.get("leagues-#{id}")
        league = if league_events.nil? || league_events.empty?
                   League.new(id)
                 else
                   League.load_from_history(league_events)
                 end
        league
      end
    end
  end
end
