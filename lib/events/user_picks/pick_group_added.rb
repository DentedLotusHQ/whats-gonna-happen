module WhatsGonnaHappen
  module Events
    module UserPicks
      class PickGroupAdded < UserPicksEvent
        attr_accessor :pick_group_id
        attr_accessor :pick_group_name
        attr_accessor :pick_option_ids
      end
    end
  end
end
