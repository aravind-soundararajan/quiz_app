class Question < ActiveRecord::Base
  attr_accessible :answer, :content, :hint, :option1, :option2, :option3, :option4, :user_id
    belongs_to :user
  validates :user_id, :presence => true
  validates :content,:presence =>true
  validates :answer, :presence => true
  validates :option1, :presence => true
  validates :option2, :presence => true
  validates :option3, :presence => true
  validates :option4, :presence => true
  
end
