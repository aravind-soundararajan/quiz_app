class Score < ActiveRecord::Base
  attr_accessible :mark, :user_id
  belongs_to :user
  validates :user_id, :presence => true
  
end
