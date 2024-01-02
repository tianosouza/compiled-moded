class ExamsController < ApplicationController
  before_action :authenticate_user!

  def index
    @exams = Exam.all
  end

  def new
    @exam = Exam.new
    10.times { @exam.questions.build } 
  end

  def create
    @exam = Exam.new(exam_params)
    if @exam.save
      redirect_to @exam, notice: 'Compilado criado com sucesso!'
    else
      render :new
    end
  end

  def show
    @exam = Exam.find(params[:id])
  end

  private

  def exam_params
    params.require(:exam).permit(:name, :university, questions_attributes: [:id, :question_text, :answer])
  end

end
