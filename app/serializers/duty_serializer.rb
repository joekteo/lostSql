class DutySerializer < ActiveModel::Serializer
  attributes :id, :title
  has_many :jobs
  has_many :users
end