# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'when accessing a User' do
    let(:user) { create(:user) }

    describe 'full_name method' do
      it 'returns the name' do
        expect(user.full_name).to(include(user.name))
      end

      it 'returns the last name' do
        expect(user.full_name).to(include(user.last_name))
      end
    end
  end
end
