module WhatsGonnaHappen
  module Events
    module UserPicks
      class PickOptionAdded < UserPicksEvent
        attr_accessor :pick_option
      end
    end
  end
end
