class User < ActiveRecord::Base
  default_scope -> { order('created_at ASC') }
  has_many :articles
  has_many :comments
  has_many :jobs, dependent: :destroy
  has_many :duties, through: :jobs
end