# Model with the Bucketlist attributes
class Bucketlist < ActiveRecord::Base
  belongs_to :user, foreign_key: :created_by, class_name: "User"
  has_many :items, dependent: :destroy

  validates :name, presence: true
  validates :created_by, presence: true

  scope :search, -> (word) { where("bucketlists.name LIKE ?", "%#{word}%") }

  def self.with_items
    includes(:items)
  end
end
