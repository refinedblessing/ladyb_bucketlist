class User < ActiveRecord::Base
  has_secure_password

  has_many :bucketlists, foreign_key: :created_by, :class_name => "Bucketlist",
  dependent: :destroy
  has_many :items, through: :bucketlists

  validates_associated :bucketlists, uniqueness: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, length: {maximum: 50, minimum: 3}
  validates :email, presence: true, uniqueness: {case_sensitive: false},
  format: {with: VALID_EMAIL_REGEX}
end
