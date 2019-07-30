# frozen_string_literal: true

class Question < ApplicationRecord
  validates :question, presence: true
end
