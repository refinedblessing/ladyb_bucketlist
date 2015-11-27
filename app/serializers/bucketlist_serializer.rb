# Serializer for Bucketlist object representation
class BucketlistSerializer < ActiveModel::Serializer
  attributes :id, :name, :items, :created_by, :date_created, :date_modified

  has_many :items

  def date_created
    object.created_at.strftime("%B %-d, %Y %I:%M %p")
  end

  def date_modified
    object.updated_at.strftime("%B %-d, %Y %I:%M %p")
  end

  def created_by
    name = object.user.name
    name = object.user.email if name.nil?
    name
  end
end
