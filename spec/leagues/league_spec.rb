require 'leagues'

module WhatsGonnaHappen
  module Leagues
    RSpec.describe League do
      context 'users' do
        let(:first_user) { 'fake' }
        let(:league_id) { 'godzilla_heads' }

        context 'adding users' do
          subject { League.new(league_id) }
          it 'only generates 1 event when same user added twice' do
            event_count = 0
            subject.on Events::Leagues::UserAdded do |event|
              event_count += 1
            end
  
            subject.add_user(first_user)
            subject.add_user(first_user)
  
            expect(event_count).to eq(1)
          end
        end

        context 'removing users' do
          subject do
            added_event = Events::Leagues::UserAdded.new.tap do |e|
              e.league_id = league_id
              e.user_id = first_user
            end
            league = League.load_from_history([added_event])
            league
          end
          it 'generates an event when an existing user is removed' do
            event_count = 0
            subject.on Events::Leagues::UserRemoved do |event|
              event_count += 1
            end

            subject.remove_user(first_user)
            expect(event_count).to eq(1)
          end
        end
      end
    end
  end
end