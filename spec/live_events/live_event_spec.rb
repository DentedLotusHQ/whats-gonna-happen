require 'live_events'
require 'events'
require 'date'

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

      context 'dates' do
        subject { LiveEvent.new(live_event_id) }
        let(:event_date) { Date.new(2001, 1, 1) }
        it 'setting the event date generates an event' do
          event_data = nil

          subject.on Events::LiveEvents::EventDateSet do |event|
            event_data = event.event_date
          end

          subject.set_event_date(event_date)
          expect(event_data).to eq(event_date.to_s)
        end
      end
    end
  end
end