require 'entity'
require 'events'

module WhatsGonnaHappen
  module Leagues
    class League
      include Entity

      def self.load_from_history(events)
        return nil if events.empty?
        id = events[0].league_id
        league = League.new(id)

        events.each do |event|
          league.apply_event(event)
        end
        league
      end

      def initialize(id)
        @id = id
        @users = []
        on Events::Leagues::UserAdded do |event|
          apply_user_added(event)
        end

        on Events::Leagues::UserRemoved do |event|
          apply_user_removed(event)
        end
      end

      def add_user(user_id)
        return if @users.any? { |u| u == user_id }
        event = Events::Leagues::UserAdded.new.tap do |e|
          e.league_id = @id
          e.user_id = user_id
        end
        publish(event)
      end

      def remove_user(user_id)
        return unless @users.any? { |u| u == user_id }
        event = Events::Leagues::UserRemoved.new.tap do |e|
          e.league_id = @id
          e.user_id = user_id
        end

        publish(event)
      end

      def apply_user_added(event)
        @users.push(event.user_id)
      end

      def apply_user_removed(event)
        @users.delete(event.user_id)
      end
    end
  end
end