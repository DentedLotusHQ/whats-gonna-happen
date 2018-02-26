require 'entity'

module WhatsGonnaHappen
  module LiveEvents
    class LiveEvent
      include Entity

      def initialize(id)
        @id = id
        @event_date = nil
        @created_date = nil
        @open_date = nil
        @close_date = nil

        register
      end

      def initialize_event(created_date, open_date = nil)
        return unless @created_date.nil?
        event = Events::LiveEvents::Created.new.tap do |e|
          e.created_date = created_date.to_s
        end

        publish(event)

        if open_date.nil?
          set_open_date(created_date)
        else
          set_open_date(open_date)
        end
      end

      def set_open_date(open_date)
        event = Events::LiveEvents::OpenDateSet.new.tap do |e|
          e.open_date = open_date.to_s
        end

        publish(event)
      end

      def set_event_date(event_date)
        return unless event_date.respond_to?(:strftime)
        event = Events::LiveEvents::EventDateSet.new.tap do |e|
          e.live_event_id = @id
          e.event_date = event_date.to_s
        end
        publish(event)
      end

      def set_close_date(close_date)
        event = Events::LiveEvents::CloseDateSet.new.tap do |e|
          e.live_event_id = @id
          e.close_date = close_date.to_s
        end

        publish(event)
      end

      private
      def register
        on Events::LiveEvents::EventDateSet do |event|
          apply_event_date_set(event)
        end

        on Events::LiveEvents::Created do |event|
          apply_created(event)
        end
      end

      private
      def apply_event_date_set(event)
        @event_date = Date.parse(event.event_date)
      end

      private
      def apply_created(event)
        @created_date = Date.parse(event.created_date)
      end
    end
  end
end