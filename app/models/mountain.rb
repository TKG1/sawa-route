class Mountain < ApplicationRecord
  belongs_to :prefecture
  has_many :routes

  mount_uploader :image, Mountain::ImageUploader

  validates :name, presence: true
end
