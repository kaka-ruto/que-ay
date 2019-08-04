# frozen_string_literal: true

class Result < ApplicationRecord
  belongs_to :user
  belongs_to :answer

  def question_text
    answer.question_text
  end

  def answer_text
    answer.answer
  end

  def answer_score
    answer.points
  end
end
