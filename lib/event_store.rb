module WhatsGonnaHappen
  class EventStore
    def initialize
      @streams = Hash.new { |h, k| h[k] = [] }
    end

    def get(stream)
      @streams[stream]
    end

    def current_position(stream)
      @streams[stream].length
    end

    def append(stream, event)
      stream = @streams[stream]
      stream.push(event)
    end
  end
end
