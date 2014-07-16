class LikesController < ApplicationController
  before_action :authenticate_user!
  
  def create
    Like.create(like_params)
    redirect_to question_path set_question_id
  end
  
  private
  
  def set_question_id
    Answer.find_by(id: params[:like][:answer_id]).question
  end
  
  def like_params
    params.require(:like).permit(:answer_id, :user_id)
  end
end
