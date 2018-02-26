require 'entity'

module WhatsGonnaHappen
  module LiveEvents
    class LiveEvent
      include Entity

      def initialize(id)
        @id = id
        @event_date = nil
      end

      def set_event_date(event_date)
        return unless event_date.respond_to?(:strftime)
        event = Events::LiveEvents::EventDateSet.new.tap do |e|
          e.live_event_id = @id
          e.event_date = event_date.to_s
        end
        publish(event)
      end

      private
      def register
        on Events::LiveEvents::EventDateSet do |event|
          apply_event_date_set(event)
        end
      end
    end
  end
end