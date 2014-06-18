class Comment < ActiveRecord::Base
  default_scope -> { order('created_at ASC') }
  belongs_to :article
  belongs_to :user
  belongs_to :comment
  has_many :comments, dependent: :destroy
end