class TagSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :articles
end
