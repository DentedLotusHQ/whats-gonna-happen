module WhatsGonnaHappen
  module Events
    module UserPicks
      class PickOptionRemoved < UserPicksEvent
        attr_accessor :pick_option_id
      end
    end
  end
end
