class QuestionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  def index
    #@questions = Question.all
    @questions = Question.all.includes [:user, :answers]
  end

  def show
    @answer = Answer.new
  end

  def new
    @question = Question.new
  end

  def edit
  end

  def create
    @question = Question.new(question_params)
    @question.user = current_user

    if current_user.enough_for_question? && @question.save
      current_user.pay_for_question
      redirect_to @question, notice: 'Question was successfully created.'
    else
      flash.now[:error] = "#{current_user.points} points is not enough"
      #TO DO report other saving error reasons
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to @question, notice: 'Question was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if @question.destroy
      #flash.now[:notice] = 'Question was successfully destroyed.'
      #render :index
      redirect_to questions_url, notice: 'Question was successfully destroyed.'
    else
      redirect_to question_url, alert: 'Could not destoy the question'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:title, :contents)
    end
end
