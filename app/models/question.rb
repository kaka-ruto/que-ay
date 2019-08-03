# frozen_string_literal: true

class Question < ApplicationRecord
  has_many :answers

  validates :question, presence: true

  def question_text
    self.question
  end
end
