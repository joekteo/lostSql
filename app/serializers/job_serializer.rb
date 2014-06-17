class JobSerializer < ActiveModel::Serializer
  attributes :id, :starts_on, :ends_on
  has_one :duty
  has_one :user
end
