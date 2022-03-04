class Route < ApplicationRecord
  belongs_to :mountain
  has_one :map
  has_many :users
  has_many :comments, dependent: :destroy
  has_many :commented_users, through: :comments, source: :user
  has_many :favorites, dependent: :destroy

  mount_uploader :image, Route::ImageUploader

  enum schedule: { '日帰り': 0, '1泊2日': 1, '2泊3日': 2 }
  enum level: { '入門': 0, '初級': 1, '中級': 2, '上級': 3 }

  validates :name, :description, :schedule, :level, :time, :length, presence: true
end
