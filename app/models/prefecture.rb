class Prefecture < ApplicationRecord
  has_many :mountains

  validates :name, presence: true, uniqueness: true
end
