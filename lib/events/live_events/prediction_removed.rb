module WhatsGonnaHappen
  module Events
    module LiveEvents
      class PredictionRemoved < LiveEventEvent
        attr_accessor :prediction_id
      end
    end
  end
end
