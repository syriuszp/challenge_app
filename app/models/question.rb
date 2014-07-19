class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  
  def answer_accepted?
    (Answer.where(question_id: self.id).select {|answer| answer.accepted?}).empty? ? false : true
  end
  
  def author
    User.find(self.user_id)
  end
end
