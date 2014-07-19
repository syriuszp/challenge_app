class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_question, only: [:create, :update]
  before_action :set_answer, only: [:update]

  def create
    @answer = Answer.new(answer_params)
    @answer.user = current_user
    @answer.question = @question

    if @answer.save
      redirect_to question_path(@question), notice: "Answer was successfully created."
    else
      redirect_to question_path(@question), alert: "There was an error when adding answer."
    end
  end

  def update
    
    if current_user.id == @answer.question.user.id
      if @answer.accept
        set_answer_author.earn_for_accept
        redirect_to question_path(@question)
      else
        redirect_to question_path(@question), alert: "Could not accept an answer #{@answer.errors.messages}"
      end
    else
      redirect_to question_path(@question), alert: "Only question owner can accept the answer"
    end  
  end

  private
  
    def set_answer_author
      @answer.user
    end
    
    def set_question
      @question = Question.find(params[:question_id])
    end
    
    def set_answer
      @answer = Answer.find(params[:answer_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:contents)
    end
end
