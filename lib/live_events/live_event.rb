require 'date'

require 'entity'

module WhatsGonnaHappen
  module LiveEvents
    class LiveEvent
      include Entity

      def initialize(id)
        @id = id
        @user_id = nil
        @event_date = nil
        @created_date = nil
        @open_date = nil
        @close_date = nil
        @predictions = []

        register
      end

      def create(user_id, created_date, open_date = nil)
        return unless @created_date.nil?
        event = Events::LiveEvents::Created.new.tap do |e|
          e.created_date = created_date.to_s
          e.user_id = user_id
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

      def add_prediction(prediction)
        return if @predictions.any? { |p| p.id == prediction.id }

        event = Events::LiveEvents::PredictionAdded.new.tap do |e|
          e.live_event_id = @id
          e.prediction = prediction
        end

        publish(event)
      end

      def remove_prediction(prediction_id)
        return unless @predictions.any? { |p| p.id == prediction_id }
      end

      def update_prediction(prediction)
      end

      def set_prediction_final(prediction_id, final)
      end

      private

      def register
        on Events::LiveEvents::EventDateSet do |event|
          apply_event_date_set(event)
        end

        on Events::LiveEvents::Created do |event|
          apply_created(event)
        end

        on Events::LiveEvents::CloseDateSet do |event|
          apply_close_date_set(event)
        end

        on Events::LiveEvents::PredictionAdded do |event|
          apply_prediction_added(event)
        end
      end

      private

      def apply_event_date_set(event)
        @event_date = Date.parse(event.event_date)
      end

      private

      def apply_created(event)
        @created_date = Date.parse(event.created_date)
        @user = event.user_id
      end

      def apply_close_date_set(event)
        @close_date = Date.parse(event.close_date)
      end

      def apply_prediction_added(event)
        @predictions.push(event.prediction)
      end
    end
  end
end
