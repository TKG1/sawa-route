class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :route

  validates :text, presence: true, length: { maximum: 65_535 }
end
