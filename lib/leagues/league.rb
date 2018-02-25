require 'entity'
require 'events'

module WhatsGonnaHappen
  module Leagues
    class League
      include Entity

      def initialize
        @users = []
        on Events::Leagues::UserAdded do |event|
          apply_user_added(event)
        end
      end

      def add_user(user_id)
        return if @users.any? { |u| u == user_id }
        event = Events::Leagues::UserAdded.new.tap do |e|
          e.user_id = user_id
        end
        publish(event)
      end

      def do_thing
        event = Events::Event.new
        publish(event)
      end

      def apply_user_added(event)
        @users.push(event.user_id)
      end
    end
  end
end