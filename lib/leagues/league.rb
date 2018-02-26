require 'date'

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
        @opened_time = nil
        @closed_time = nil
        @public = false
        @allows_invites = true
        on Events::Leagues::UserAdded do |event|
          apply_user_added(event)
        end

        on Events::Leagues::UserRemoved do |event|
          apply_user_removed(event)
        end

        on Events::Leagues::Opened do |event|
          apply_opened(event)
        end

        on Events::Leagues::Closed do |event|
          apply_closed(event)
        end
      end

      def open(opened_time)
        return unless @opened_time.nil?
        event = Events::Leagues::Opened.new.tap do |e|
          e.league_id = @id
          e.opened_time = opened_time.to_s
        end

        publish(event)
      end

      def close(closed_time)
        return unless @closed_time.nil?

        event = Events::Leagues::Closed.new.tap do |e|
          e.league_id = @id
          e.closed_time = closed_time.to_s
        end

        publish(event)
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

      private
      def apply_user_added(event)
        @users.push(event.user_id)
      end

      private
      def apply_user_removed(event)
        @users.delete(event.user_id)
      end

      private
      def apply_opened(event)
        @opened_time = Date.parse(event.opened_time)
      end

      private
      def apply_closed(event)
        @closed_time = Date.parse(event.closed_time)
      end
    end
  end
end