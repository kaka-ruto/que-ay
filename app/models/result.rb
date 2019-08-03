# frozen_string_literal: true

class Result < ApplicationRecord
  belongs_to :answer

  def question_text
    answer.question_text
  end
end
