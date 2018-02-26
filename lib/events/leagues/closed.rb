require_relative 'league_event'

module WhatsGonnaHappen
  module Events
    module Leagues
      class Closed < LeagueEvent
        attr_accessor :closed_time
      end
    end
  end
end