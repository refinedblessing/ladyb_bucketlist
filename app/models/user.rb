# Model with user attributes
class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  has_secure_password

  has_many :bucketlists, foreign_key: :created_by,
                         class_name: "Bucketlist",
                         dependent: :destroy
  has_many :items, through: :bucketlists

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: { with: VALID_EMAIL_REGEX }

  def generate_auth_token
    user = self
    payload = { user_id: user.id, email: user.email }
    AuthToken.encode(payload)
  end
end
