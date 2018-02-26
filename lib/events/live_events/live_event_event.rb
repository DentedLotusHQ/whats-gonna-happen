module WhatsGonnaHappen
  module Events
    module LiveEvents
      class LiveEventEvent < Event
        attr_accessor :live_event_id
      end
    end
  end
end