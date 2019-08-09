require 'rails_helper'

RSpec.describe Answer, type: :model do
  describe 'validations' do
    it {  should validate_presence_of(:body) }
    it {  should validate_presence_of(:points) }
  end

  describe 'associations' do
    it { should belong_to(:question) }
    it { should have_one(:result) }
  end

  describe '.question_body' do
    it 'returns the body of a question' do
      question = create(:question, body: 'Been to Portugal for investment?')
      answer = create(:answer, question: question)

      expect(answer.question_body).to eq question.body
    end
  end

  describe '.correct_answer' do
    it 'returns the correct answer' do
      question = create(:question)
      right_answer = create(:answer, question: question, body: 'Yes', points: '3', is_correct: true)
      chosen_answer = create(:answer, question: question, body: 'No', points: '0', is_correct: false)

      expect(chosen_answer.correct_answer).to eq right_answer
    end
  end
end
