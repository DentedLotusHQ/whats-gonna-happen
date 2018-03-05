require 'securerandom'

module WhatsGonnaHappen
  class EventBus
    def initialize
    end

    def subscribe(*event_classes, &block)
      event_classes.each { |event_class| subscribers[event_class].push(block) }
      token = SecureRandom.uuid
      tokens[token] = block
      token
    end

    def unsubscribe(*event_classes, token)
      return unless tokens.has_key?(token)
      block = tokens[token]

      event_classes.each do |event_class|
        handlers = subscribers[event_class]
        handlers.delete(block)
      end
    end

    def publish(event)
      handlers = []
      ancestors = event.class.ancestors.select do |c|
        ![Object, Kernel, BasicObject].include?(c)
      end
      ancestors.each do |ancestor_class|
        ancestor_handlers = subscribers[ancestor_class]
        if ancestor_handlers.empty?
          next
        end
        ancestor_handlers.each do |ancestor_handler|
          handlers.push(ancestor_handler) unless handlers.include?(ancestor_handler)
        end
      end
      handlers.each { |handler| handler.call(event) }
    end

    def subscribers
      @subscribers ||= Hash.new { |h, k| h[k] = [] }
    end

    def tokens
      @tokens ||= Hash.new
    end
  end
end
