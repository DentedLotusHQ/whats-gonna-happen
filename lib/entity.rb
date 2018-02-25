module WhatsGonnaHappen
  module Entity
    def on(*event_classes, &block)
      event_classes.each { |event_class| event_handlers[event_class].push(block) }
    end

    def on_all(&block)
      event_handlers[:all_events].push(block)
    end

    def event_handlers
      @event_handlers ||= Hash.new { |h, k| h[k] = [] }
    end

    def apply_event(event)
      handlers = event_handlers[event.class]
      handlers.each { |handler| handler.call(event) }
    end

    def publish(event)
      apply_event(event)
    end
  end
end