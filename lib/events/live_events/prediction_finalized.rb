module WhatsGonnaHappen
  module Events
    module LiveEvents
      class PredictionFinalized < LiveEventEvent
        attr_accessor :prediction_id
        attr_accessor :final
        attr_accessor :score
      end
    end
  end
end
