module WhatsGonnaHappen
  module Events
    module Leagues
      class LeagueEvent < Event
        attr_accessor :league_id
        def initialize
          @type = self.class.to_s
        end
      end
    end
  end
end