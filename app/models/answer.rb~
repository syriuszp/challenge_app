class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  has_many :like, dependent: :delete_all
  validates_presence_of :question_id, :user_id, :contents

  def likes_count
    self.like.count
  end

end
