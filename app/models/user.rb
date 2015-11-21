class User < ActiveRecord::Base
  has_secure_password

  has_many :bucketlists, dependent: :destroy
  has_many :items, through: :bucketlists

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, length: {maximum: 50, minimum: 3}
  validates :email, presence: true, uniqueness: {case_sensitive: false},
  format: {with: VALID_EMAIL_REGEX}
end
