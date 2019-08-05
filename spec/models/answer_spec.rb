require 'rails_helper'

RSpec.describe Answer, type: :model do
  describe 'validations' do
    it {  should validate_presence_of(:answer) }
    it {  should validate_presence_of(:points) }
  end

  describe 'associations' do
    it { should belong_to(:question) }
    it { should have_one(:result) }
  end

  describe '.question_text' do
    it 'returns the question text' do
      question = create(:question, question: 'Have you had risks before?')

      expect(question.question_text).to eq 'Have you had risks before?'
    end
  end

  describe '.correct_answer' do
    it 'returns the correct answer' do
      question = create(:question)
      right_answer = create(:answer, question: question, answer: 'Yes', points: '3', is_correct: true)
      chosen_answer = create(:answer, question: question, answer: 'No', points: '0', is_correct: false)
      expect(chosen_answer.correct_answer).to eq right_answer
    end
  end
end
