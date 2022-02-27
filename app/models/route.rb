class Route < ApplicationRecord
  belongs_to :mountain
  has_one :map

  mount_uploader :image, Route::ImageUploader

  validates :name, :description, :schedule, :level, :time, :length, presence: true

  enum schedule: { '日帰り': 0, '1泊2日': 1, '2泊3日': 2 }
  enum level: { '入門': 0, '初級': 1, '中級': 2, '上級': 3 }
end
