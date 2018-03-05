require 'event_store'

module WhatsGonnaHappen
  RSpec.describe EventStore, '#append' do
    context 'with no events in stream' do
      let(:event) { 'event' }
      let(:stream_name) { 'test' }

      it 'successfully writes the events' do
        subject.append(stream_name, event)
        events = subject.get(stream_name)
        expect(events.length).to eq(1)
      end
    end
  end
end
