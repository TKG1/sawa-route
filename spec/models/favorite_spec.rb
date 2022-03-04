require 'rails_helper'

RSpec.describe Favorite, type: :model do
  describe 'validation' do
    let(:user) { create(:user) }
    let(:another_user) { create(:user) }
    let(:route) { create(:route) }
    let!(:favorite) { create(:favorite, user_id: user.id, route_id: route.id) }

    it 'is valid with all attributes' do
      favorite = build(:favorite)
      expect(favorite).to be_valid
      expect(favorite.errors).to be_empty
    end

    it 'allows two users to share a route id' do
      favorite = build(:favorite, user_id: another_user.id, route_id: route.id)

      expect(favorite).to be_valid
      expect(favorite.errors).to be_empty
    end

    it 'does not allow a user to register a dupulicate route id' do
      favorite_with_dupulicate_user = build(:favorite, user_id: user.id, route_id: route.id)

      expect(favorite_with_dupulicate_user).to be_invalid
      expect(favorite_with_dupulicate_user.errors[:user_id]).to include('はすでに存在します')
    end
  end
end
