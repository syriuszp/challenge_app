class LikesController < ApplicationController
  def create
    Like.create(answer_id: params[:answer],user_id: params[:user])
    redirect_to "/questions/#{params[:question]}"
  end
end
