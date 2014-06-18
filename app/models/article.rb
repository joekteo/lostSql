class Article < ActiveRecord::Base
  default_scope -> { order('created_at ASC') }
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :tags
end