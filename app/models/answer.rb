# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question
  has_one :result

  validates :answer, presence: true
  validates :points, presence: true
end
