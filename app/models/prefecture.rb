class Prefecture < ApplicationRecord
  has_many :mountains
  has_many :routes, through: :mountains

  validates :name, presence: true, uniqueness: true
end
