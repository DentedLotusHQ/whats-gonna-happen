module WhatsGonnaHappen
  module Events
    module LiveEvents
      class PredictionUpdated < LiveEventEvent
        attr_accessor :prediction
      end
    end
  end
end
