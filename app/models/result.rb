# frozen_string_literal: true

class Result < ApplicationRecord
  belongs_to :user
  belongs_to :answer

  delegate :points, to: :answer, prefix: true
  delegate :is_correct, to: :answer, prefix: true
  delegate :correct_answer, to: :answer

  def question_text
    answer.question_text
  end

  def answer_text
    answer.answer
  end
end
