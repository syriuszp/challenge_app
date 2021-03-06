class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    
    if (Like.create(like_params)).valid?
      set_answer_author.earn_for_like
    end
     
     set_answer

    respond_to do |format|
      format.html { redirect_to question_path set_question_id and return}
      format.js
    end

  end

  private

  def set_answer
    @answer = Answer.find_by(id: params[:like][:answer_id])
  end

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
