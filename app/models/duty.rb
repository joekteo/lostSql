class Duty < ActiveRecord::Base
  default_scope -> { order('created_at ASC') }
  has_many :jobs, dependent: :destroy
  has_many :users, through: :jobs
end