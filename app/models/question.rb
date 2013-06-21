class Question < ActiveRecord::Base
  attr_accessible :content ,:user_id ,:answer
  belongs_to :user
  validates :content, :presence => true, :length => { :maximum => 200 }
  validates :user_id, :presence => true
  validates :answer => true

  default_scope :order => 'questions.created_at DESC'
end
