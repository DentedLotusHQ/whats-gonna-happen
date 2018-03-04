module WhatsGonnaHappen
  module Events
    module UserPicks
      class PickOptionUpdated < UserPicksEvent
        attr_accessor :pick_option
      end
    end
  end
end
