# Model with the Bucketlist attributes
class Bucketlist < ActiveRecord::Base
  belongs_to :user, foreign_key: :created_by, class_name: "User"

  validates :name, presence: true
  validates :created_by, presence: true
end
