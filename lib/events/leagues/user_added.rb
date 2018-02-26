require_relative 'league_event'

module WhatsGonnaHappen
  module Events
    module Leagues
      class UserAdded < LeagueEvent
        attr_accessor :user_id
      end
    end
  end
end