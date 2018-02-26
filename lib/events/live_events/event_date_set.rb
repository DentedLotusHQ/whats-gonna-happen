module WhatsGonnaHappen
  module Events
    module LiveEvents
      class EventDateSet < LiveEventEvent
        attr_accessor :event_date
      end
    end
  end
end