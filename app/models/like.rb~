class Like < ActiveRecord::Base
  belongs_to :answer
  validates :user_id, :answer_id, :presence => true
  validates_uniqueness_of :answer_id, scope: :user_id
end
