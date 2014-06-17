class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email
  has_many :articles
  has_many :comments
  has_many :jobs
  has_many :duties
end
