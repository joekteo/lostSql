class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body
  has_one :article
  has_one :user
  has_one :comment
  has_many :comments
end