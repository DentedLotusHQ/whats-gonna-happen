module WhatsGonnaHappen
  module Entity

    def on(*event_classes, &block)
      event_classes.each { |event_class| event_handlers[event_class].push(block) }
    end

    def event_handlers
      @event_handlers ||= Hash.new { |h, k| h[k] = [] }
    end

    def apply_event(event)
      handlers = []
      ancestors = event.class.ancestors.select do |c|
        ![Object, Kernel, BasicObject].include?(c)
      end
      ancestors.each do |ancestor_class|
        ancestor_handlers = event_handlers[ancestor_class]
        if ancestor_handlers.empty?
          next
        end
        ancestor_handlers.each do |ancestor_handler|
          handlers.push(ancestor_handler) unless handlers.include?(ancestor_handler)
        end
      end
      handlers.each { |handler| handler.call(event) }
    end

    def publish(event)
      apply_event(event)
    end
  end
end