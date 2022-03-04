class Favorite < ApplicationRecord
  belongs_to :route
  belongs_to :user

  validates :user_id, uniqueness: { scope: :route_id }
end
