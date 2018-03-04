module WhatsGonnaHappen
  module Events
    module UserPicks
      class PredictionTemplateUpdated < UserPicksEvent
        attr_accessor :prediction_template
      end
    end
  end
end
