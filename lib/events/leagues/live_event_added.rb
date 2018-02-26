require_relative 'league_event'

module WhatsGonnaHappen
  module Events
    module Leagues
      class LiveEventAdded < LeagueEvent
        attr_accessor :live_event_id
      end
    end
  end
end