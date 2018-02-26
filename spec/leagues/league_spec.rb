require 'leagues'
require 'date'

module WhatsGonnaHappen
  module Leagues
    RSpec.describe League do
      let(:league_id) { 'godzilla_heads' }

      context 'users' do
        let(:first_user) { 'fake' }

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
      
      context 'opening and closing' do
        subject { League.new(league_id) }

        let(:opened_time) { Date.new(2001,1,1) }
        let(:closed_time) { Date.new(2001,1,1) }

        it 'only generates 1 event no matter how often open is called' do
          event_count = 0

          subject.on Events::Leagues::Opened do
            event_count += 1
          end

          subject.open(opened_time)
          subject.open(opened_time)
          expect(event_count).to eq(1)
        end

        it 'only generates 1 event no matter how often close is called' do
          event_count = 0

          subject.on Events::Leagues::Closed do
            event_count += 1
          end

          subject.close(closed_time)
          subject.close(closed_time)
          expect(event_count).to eq(1)
        end
      end

      context 'invite mode' do
        subject { League.new(league_id) }

        let(:invite_mode) { Leagues::InviteModes::PUBLIC }
        let(:bad_invite_mode) { :totally_real_mode }

        it 'generates events when invite mode is set' do
          event_count = 0

          subject.on Events::Leagues::InviteModeSet do
            event_count += 1
          end

          subject.set_invite_mode(invite_mode)
          expect(event_count).to eq(1)
        end

        it 'does not generate an event with wrong invite mode' do
          event_count = 0

          subject.on Events::Leagues::InviteModeSet do
            event_count += 1
          end

          subject.set_invite_mode(bad_invite_mode)
          expect(event_count).to eq(0)
        end
      end

      context 'discoverable' do
        subject { League.new(league_id) }

        let(:discoverable) { true }

        it 'generates event when discoverable set' do
          event_count = 0

          subject.on Events::Leagues::DiscoverableSet do
            event_count += 1
          end

          subject.set_discoverable(discoverable)
          expect(event_count).to eq(1)
        end
      end
    end
  end
end