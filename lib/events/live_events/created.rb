module WhatsGonnaHappen
  module Events
    module LiveEvents
      class Created < LiveEventEvent
        attr_accessor :created_date
        attr_accessor :user_id
      end
    end
  end
end
