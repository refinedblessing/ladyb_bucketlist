# Serializer for User object.
class UserSerializer < ActiveModel::Serializer
  attributes :name, :email
end
