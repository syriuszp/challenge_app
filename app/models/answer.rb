class Answer < ActiveRecord::Base
  belongs_to :question
  delegate :title, :user_id, :to => :question, :prefix => true

  belongs_to :user
  delegate :username, :to => :user, :prefix => true


  has_many :like, dependent: :delete_all
  validates_presence_of :question_id, :user_id, :contents

  def likes_count
    self.like.count
  end

  def accept
    if  (Answer.where(question_id: self.question_id).select {|answer| answer.accepted?}).empty?
      self.update_attributes(accepted: true)
    end
  end

  def accepted?
    self.accepted
  end

end
