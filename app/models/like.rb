class Like < ActiveRecord::Base
  belongs_to :answer
  validates_presence_of :user_id, :answer_id
  validates_uniqueness_of :answer_id, scope: :user_id
  validate :not_self_liking
  
  def not_self_liking
    if answer = Answer.find_by(id: self.answer_id)
      errors.add(:user_id, 'User can not like answer she is author of') if self.user_id == answer.user_id
    end  
  end

end
 
