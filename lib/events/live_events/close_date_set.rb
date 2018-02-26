module WhatsGonnaHappen
  module Events
    module LiveEvents
      class CloseDateSet < LiveEventEvent
        attr_accessor :close_date
      end
    end
  end
end