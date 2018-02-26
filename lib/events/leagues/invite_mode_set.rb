require_relative 'league_event'

module WhatsGonnaHappen
  module Events
    module Leagues
      class InviteModeSet < LeagueEvent
        attr_accessor :invite_mode
      end
    end
  end
end