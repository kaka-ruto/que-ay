# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question
  has_one :result

  validates :body, presence: true
  validates :points, presence: true

  def question_body
    question.body
  end

  def correct_answer
    question.answers.each do |answer|
      return answer if answer.is_correct
    end
  end
end
