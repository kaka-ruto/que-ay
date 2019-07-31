class QuestionsController < ApplicationController
  def index; end

  def show
    @question = Question.find(params[:id])
    @previous = Question.where('id < ?', params[:id]).order(:id).first
    @next = Question.where('id > ?', params[:id]).order(:id).first
  end
end
