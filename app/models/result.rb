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

  def answer_correct?
    answer.is_correct?
  end
  
  def question_correct_answer
    answer.correct_answer
  end
end
