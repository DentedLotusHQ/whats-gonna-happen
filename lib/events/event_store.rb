module WhatsGonnaHappen
  module Events
    class EventStore
  
      def initialize
        @streams = Hash.new { |h, k| h[k] = [] }
      end
    
      def get(stream)
        @streams[stream]
      end
    
      def append(stream, event)
        stream = @streams[stream]
        stream.push(event)
      end
    end
  end
end