class Bucketlist < ActiveRecord::Base
  belongs_to :created_by, :class_name => "User"

  validates :name, presence: true
  validates :created_by, presence: true
end
