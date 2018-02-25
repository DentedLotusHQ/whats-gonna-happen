module WhatsGonnaHappen
  module Events
    module Leagues
      class UserAdded < Event
        attr_accessor :user_id
        def initialize
          @type = self.class.to_s
        end
      end
    end
  end
end