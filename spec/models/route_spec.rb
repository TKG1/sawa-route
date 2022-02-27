require 'rails_helper'

RSpec.describe Route, type: :model do
  describe 'validation' do
    it 'is valid with all attributes' do
      route = build(:route)
      expect(route).to be_valid
      expect(route.errors).to be_empty
    end

    it 'is invalid without a name' do
      route_without_name = build(:route, name: '')
      expect(route_without_name).to be_invalid
      expect(route_without_name.errors[:name]).to include('を入力してください')
    end

    it 'is invalid without a description' do
      route_without_description = build(:route, description: '')
      expect(route_without_description).to be_invalid
      expect(route_without_description.errors[:description]).to include('を入力してください')
    end

    it 'is invalid without a level' do
      route_without_level = build(:route, level: '')
      expect(route_without_level).to be_invalid
      expect(route_without_level.errors[:level]).to include('を入力してください')
    end

    it 'is invalid without a schedule' do
      route_without_schedule = build(:route, schedule: '')
      expect(route_without_schedule).to be_invalid
      expect(route_without_schedule.errors[:schedule]).to include('を入力してください')
    end

    it 'is invalid without a time' do
      route_without_time = build(:route, time: '')
      expect(route_without_time).to be_invalid
      expect(route_without_time.errors[:time]).to include('を入力してください')
    end

    it 'is invalid without a length' do
      route_without_length = build(:route, length: '')
      expect(route_without_length).to be_invalid
      expect(route_without_length.errors[:length]).to include('を入力してください')
    end
  end
end
