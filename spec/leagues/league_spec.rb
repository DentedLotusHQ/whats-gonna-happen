require 'leagues'

module WhatsGonnaHappen
  module Leagues
    RSpec.describe League do
      context 'users' do
        it 'can add a user' do
          league = League.new

          league.on Events::Leagues::UserAdded do
            puts "got it"
          end

          league.add_user('fake')
          league.add_user('fake')
        end
      end
    end
  end
end