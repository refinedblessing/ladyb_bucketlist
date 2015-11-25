class Item < ActiveRecord::Base
  belongs_to :bucketlist

  validates :name, presence: true
  validates :bucketlist, presence: true

  scope :completed, -> { where("done = ?", TRUE) }
  scope :uncompleted, -> { where("done = ?", FALSE) }
end
