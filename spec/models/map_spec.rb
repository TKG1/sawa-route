require 'rails_helper'

RSpec.describe Map, type: :model do
  describe 'validation' do
    it 'is valid with all attributes' do
      map = build(:map)
      expect(map).to be_valid
      expect(map.errors).to be_empty
    end

    it 'is invalid without a latitude' do
      map_without_latitude = build(:map, latitude: '')
      expect(map_without_latitude).to be_invalid
      expect(map_without_latitude.errors[:latitude]).to include('を入力してください')
    end

    it 'is invalid without a longitude' do
      map_without_longitude = build(:map, longitude: '')
      expect(map_without_longitude).to be_invalid
      expect(map_without_longitude.errors[:longitude]).to include('を入力してください')
    end

    context 'when the longitude is between -180.000000 and 180.000000' do
      it 'is valid' do
        map_with_longitude = build(:map, longitude: rand(-180.0..180.0).round(rand(0..6)))
        expect(map_with_longitude).to be_valid
        expect(map_with_longitude.errors).to be_empty
      end

      it 'is valid with a -180.0000000 longitude' do
        map_with_minus_180_longitude = build(:map, longitude: -180.000000)
        expect(map_with_minus_180_longitude).to be_valid
        expect(map_with_minus_180_longitude.errors).to be_empty
      end

      it 'is valid with a 180.000000 longitude' do
        map_with_180_longitude = build(:map, longitude: 180.000000)
        expect(map_with_180_longitude).to be_valid
        expect(map_with_180_longitude.errors).to be_empty
      end

      it 'is invalid with a more then 180.000000 longitude' do
        map_with_more_than_180_longitude = build(:map, longitude: rand(180.000001..1000.0).round(6))
        expect(map_with_more_than_180_longitude).to be_invalid
        expect(map_with_more_than_180_longitude.errors[:longitude]).to include(
          'は180.0以下の値にしてください'
        )
      end

      it 'is invalid with a less then -180.000000 longitude' do
        map_with_less_than_minus_180_longitude =
          build(:map, longitude: rand(-1000.0...-180.000000).round(6))
        expect(map_with_less_than_minus_180_longitude).to be_invalid
        expect(map_with_less_than_minus_180_longitude.errors[:longitude]).to include(
          'は-180.0以上の値にしてください'
        )
      end
    end

    context 'when the latitude is between -90.000000 and 90.000000' do
      it 'is valid' do
        map_with_latitude = build(:map, latitude: rand(-90.0..90.0).round(rand(0..6)))
        expect(map_with_latitude).to be_valid
        expect(map_with_latitude.errors).to be_empty
      end

      it 'is valid with a -90.0000000 latitude' do
        map_with_minus_90_latitude = build(:map, latitude: -90.000000)
        expect(map_with_minus_90_latitude).to be_valid
        expect(map_with_minus_90_latitude.errors).to be_empty
      end

      it 'is valid with a 90.000000 latitude' do
        map_with_90_latitude = build(:map, latitude: 90.000000)
        expect(map_with_90_latitude).to be_valid
        expect(map_with_90_latitude.errors).to be_empty
      end

      it 'is invalid with a more then 90.000000 latitude' do
        map_with_more_than_90_latitude = build(:map, latitude: rand(90.000001..1000.0).round(6))
        expect(map_with_more_than_90_latitude).to be_invalid
        expect(map_with_more_than_90_latitude.errors[:latitude]).to include(
          'は90.0以下の値にしてください'
        )
      end

      it 'is invalid with a less then -90.000000 latitude' do
        map_with_less_than_minus_90_latitude =
          build(:map, latitude: rand(-1000.0...-90.000000).round(6))
        expect(map_with_less_than_minus_90_latitude).to be_invalid
        expect(map_with_less_than_minus_90_latitude.errors[:latitude]).to include(
          'は-90.0以上の値にしてください'
        )
      end
    end
  end
end
