class Question < ActiveRecord::Base
  attr_accessible :answer, :content, :hint, :user_id
  belongs_to :user
  validates :user_id, :presence => true
  validates :content,:presence =>true
  validates :answer, :presence => true
end
