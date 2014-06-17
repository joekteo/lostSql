class Job < ActiveRecord::Base
  belongs_to :duty
  belongs_to :user
end
