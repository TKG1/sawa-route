class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :authentications, dependent: :destroy
  accepts_nested_attributes_for :authentications
  has_many :routes
  has_many :comments, dependent: :destroy
  has_many :commented_routes, through: :comments, source: :route

  mount_uploader :avatar, AvatarUploader

  enum role: { general: 0, admin: 1 }

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation,
            presence: true,
            if: -> { new_record? || changes[:crypted_password] }

  validates :name, :email, presence: true, uniqueness: true

  def own?(object)
    id == object.user_id
  end
end
