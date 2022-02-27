require 'rails_helper'

RSpec.describe Prefecture, type: :model do
  describe 'validation' do
    it 'is valid with all attributes' do
      prefecture = build(:user)
      expect(prefecture).to be_valid
      expect(prefecture.errors).to be_empty
    end

    it 'is valid with an another name' do
      prefecture = create(:prefecture)
      prefecture_with_another_name = build(:prefecture, name: "another#{prefecture.name}")
      expect(prefecture_with_another_name).to be_valid
      expect(prefecture_with_another_name.errors).to be_empty
    end

    it 'is invalid without a name' do
      prefecture_without_name = build(:prefecture, name: '')
      expect(prefecture_without_name).to be_invalid
      expect(prefecture_without_name.errors[:name]).to include('を入力してください')
    end

    it 'is invalid with a duplicate name' do
      prefecture = create(:prefecture)
      prefecture_with_duplicated_name = build(:prefecture, name: prefecture.name)
      expect(prefecture_with_duplicated_name).to be_invalid
      expect(prefecture_with_duplicated_name.errors[:name]).to include('はすでに存在します')
    end
  end
end
