class LikesController < ApplicationController
  before_action :authenticate_user!
  
  def create
    if (Like.create(like_params)).valid?
      puts "P2000: #{set_answer_author.points.inspect}"
      set_answer_author.earn_for_like
      puts "P6000: #{set_answer_author.points.inspect}"
    end  
    redirect_to question_path set_question_id
  end
  
  private
  
  def set_answer_author
    User.find_by(id: Answer.find_by(id: params[:like][:answer_id]).user_id)
  end
  
  def set_question_id
    Answer.find_by(id: params[:like][:answer_id]).question
  end
  
  def like_params
    params.require(:like).permit(:answer_id, :user_id)
  end
end
