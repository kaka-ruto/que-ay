# frozen_string_literal: true

class Question < ApplicationRecord
  has_many :answers

  validates :body, presence: true
end
