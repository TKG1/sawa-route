require 'rails_helper'

RSpec.describe Mountain, type: :model do
  describe 'validation' do
    it 'is valid with all attributes' do
      mountain = build(:mountain)
      expect(mountain).to be_valid
      expect(mountain.errors).to be_empty
    end

    it 'is invalid without a name' do
      mountain_without_name = build(:mountain, name: '')
      expect(mountain_without_name).to be_invalid
      expect(mountain_without_name.errors[:name]).to include('を入力してください')
    end
  end
end
