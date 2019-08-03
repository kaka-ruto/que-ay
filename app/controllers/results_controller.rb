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
    binding.pry

    if @result.save
      redirect_to results_path
    end
  end

  private

  def result_params
    params.require(:result).permit(:answer_id)
  end
end
