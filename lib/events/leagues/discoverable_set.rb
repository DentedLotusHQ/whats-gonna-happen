require_relative 'league_event'

module WhatsGonnaHappen
  module Events
    module Leagues
      class DiscoverableSet < LeagueEvent
        attr_accessor :discoverable
      end
    end
  end
end