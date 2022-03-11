class Route < ApplicationRecord
  belongs_to :mountain
  has_one :prefecture, through: :mountain

  has_one :map
  has_many :users
  has_many :comments, dependent: :destroy
  has_many :commented_users, through: :comments, source: :user
  has_many :favorites, dependent: :destroy

  mount_uploader :image, Route::ImageUploader

  enum schedule: { one_day: 0, two_days: 1, three_days: 2 }
  enum level: { grade1: 0, grade2: 1, grade3: 2, grade3_up: 3, grade4: 4 }

  validates :name, :description, :schedule, :level, :time, :length, presence: true

  ransack_alias :names, :name_or_mountain_name_or_mountain_prefecture_name
end
