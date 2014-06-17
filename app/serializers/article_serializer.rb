class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :body
  has_one :user
  has_many :comments
  has_many :tags
end