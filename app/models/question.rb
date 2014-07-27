class Question < ActiveRecord::Base
  validates_presence_of :title

  belongs_to :user
  delegate :username, :to => :user, :prefix => true
  has_many :answers, dependent: :delete_all


  def answer_accepted?
    (Answer.where(question_id: self.id).select {|answer| answer.accepted?}).empty? ? false : true
  end

  def author
    User.find(self.user_id)
  end
end
