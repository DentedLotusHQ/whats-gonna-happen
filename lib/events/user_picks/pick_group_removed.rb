module WhatsGonnaHappen
  module Events
    module UserPicks
      class PickGroupRemoved < UserPicksEvent
        attr_accessor :pick_group_id
      end
    end
  end
end
