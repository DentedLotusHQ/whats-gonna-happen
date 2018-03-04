module WhatsGonnaHappen
  module Events
    module UserPicks
      class PredictionTemplateAdded < UserPicksEvent
        attr_accessor :prediction_template
      end
    end
  end
end
