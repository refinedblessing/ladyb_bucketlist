# Serializer for Bucketlist object representation
class BucketlistSerializer < ActiveModel::Serializer
  attributes :id, :name, :all_items, :created_by, :date_created, :date_modified

  def date_created
    object.created_at.strftime("%B %-d, %Y %I:%M %p")
  end

  def date_modified
    object.updated_at.strftime("%B %-d, %Y %I:%M %p")
  end

  def all_items
    object.items
  end

  def created_by
    object.user.name
  end
end
