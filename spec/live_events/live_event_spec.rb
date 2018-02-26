require 'live_events'

module WhatsGonnaHappen
  module LiveEvents
    RSpec.describe LiveEvent do
      let(:live_event_id) { 'fight_night' }
      context 'basic creation' do
        subject { LiveEvent.new(live_event_id) }
        it 'can create a live event' do
          subject
        end
      end
    end
  end
end