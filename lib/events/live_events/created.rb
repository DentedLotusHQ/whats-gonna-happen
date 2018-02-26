module WhatsGonnaHappen
  module Events
    module LiveEvents
      class Created < LiveEventEvent
        attr_accessor :created_date
      end
    end
  end
end