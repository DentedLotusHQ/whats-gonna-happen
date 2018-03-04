module WhatsGonnaHappen
  module Events
    module LiveEvents
      class PredictionAdded < LiveEventEvent
        attr_accessor :prediction
      end
    end
  end
end
