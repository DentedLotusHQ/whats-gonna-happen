require 'entity'
require 'events'

module WhatsGonnaHappen
  module Picks
    class UserPicks
      include Entity

      def initialize(user_id)
        @user_id = user_id
        @pick_options = []
        @prediction_templates = []
        @pick_groups = []
      end

      def create_pick_group(user_id, name, pick_options)
      end

      def add_prediction_template(template)
      end

      def add_pick_option(pick_option, add_time)
        return if @pick_options.any? { |p| p.id == pick_option.id }
        event = Events::UserPicks::PickOptionAdded.new.tap do |e|
          e.pick_option = pick_option
          e.added_time = add_time.to_s
        end
        publish(event)
      end

      def update_pick_option(pick_option, update_time)
        exists = @pick_options.any? { |p| p.id == pick_option.id }
        if exists
          add_pick_option(pick_option, update_time)
          return
        end
        event = Events::UserPicks::PickOptionUpdated.new.tap do |e|
          e.pick_option = pick_option
          e.updated_time = update_time.to_s
        end

        publish(event)
      end

      def register
        on Events::UserPicks::PickOptionAdded do |event|
          apply_pick_option_added(event)
        end

        on Events::UserPicks::PickOptionUpdated do |event|
          apply_pick_option_updated(event)
        end
      end

      def apply_pick_option_added(event)
        @pick_options.push(event.pick_option)
      end

      def apply_pick_option_updated(event)
        index = @pick_options.find_index { |p| p.id === event.pick_option.id }
        @pick_options[index] = event.pick_option
      end
    end
  end
end
