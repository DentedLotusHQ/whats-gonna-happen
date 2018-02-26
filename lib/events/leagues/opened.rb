require_relative 'league_event'

module WhatsGonnaHappen
  module Events
    module Leagues
      class Opened < LeagueEvent
        attr_accessor :opened_time
      end
    end
  end
end