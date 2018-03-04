module WhatsGonnaHappen
  module Events
    module UserPicks
      class PredictionTemplateRemoved < UserPicksEvent
        attr_accessor :prediction_template_id
      end
    end
  end
end
