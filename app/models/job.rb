class Job < ActiveRecord::Base
  default_scope -> { order('created_at ASC') }
  belongs_to :duty
  belongs_to :user
end