class Item < ActiveRecord::Base
  belongs_to :bucketlist

  validates :name, presence: true
  validates :bucketlist, presence: true

  scope :completed, -> { where("done IS ?", true) }
  scope :uncompleted, -> { where("done IS ?", false) }
end
