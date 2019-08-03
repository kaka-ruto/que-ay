# frozen_string_literal: true

class ResultsController < ApplicationController
  def index
    @results = Result.all
  end

  def new
    @result = Result.new
  end

  def create
    @result = Result.new(result_params)

    if @result.save
      if next_question_available
        redirect_to question_path(next_question)
      else
        redirect_to results_path
      end
    end
  end

  private

  def result_params
    params.require(:result).permit(:answer_id)
  end

  def next_question_available
    next_question.present?
  end

  def next_question
    params[:result][:next_question_id]
  end
end
