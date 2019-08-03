require 'rails_helper'

RSpec.describe Question, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:question) }
  end

  describe 'associations' do
    it { should have_many(:answers) }
  end

  describe '.question_text' do
    it 'returns the question text' do
      question = create(:question, question: 'Have you had risks before?')

      expect(question.question_text).to eq 'Have you had risks before?'
    end
  end
end
