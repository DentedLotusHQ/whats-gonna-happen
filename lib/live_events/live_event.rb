require 'entity'

module WhatsGonnaHappen
  module LiveEvents
    class LiveEvent
      include Entity

      def initialize(id)
        @id = id
      end
    end
  end
end