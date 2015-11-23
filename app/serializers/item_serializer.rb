class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :done, :bucketlist_id, :date_created, :date_modified

  def date_created
    object.created_at.strftime("%B %-d, %Y %I:%M %p")
  end

  def date_modified
    object.updated_at.strftime("%B %-d, %Y %I:%M %p")
  end
end
