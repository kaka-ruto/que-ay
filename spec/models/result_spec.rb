require 'rails_helper'

RSpec.describe Result, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:answer) }
  end

  describe '.question_text' do
    it 'returns the question text' do
      question = create(:question, question: 'Have you had risks before?')
      answer = create(:answer, question: question)

      expect(answer.question_text).to eq 'Have you had risks before?'
    end
  end

  describe '.answer_text' do
    it 'returns the answer text' do
      answer = create(:answer, answer: 'Not really')
      result = create(:result, answer: answer)

      expect(result.answer_text).to eq 'Not really'
    end
  end

  describe '.answer_score' do
    it 'returns the answer points' do
      answer = create(:answer, answer: 'Not really', points: '0')
      result = create(:result, answer: answer)

      expect(result.answer_score).to eq '0'
    end
  end

  describe '.answer_correct?' do
    it 'says if user got the answer or not' do
      result = create(:result)

      expect(result.answer_correct?).to eq true
    end
  end

  describe '.question_correct_answer' do
    it "returns a question's correct answer" do
      question = create(:question)
      wrong_answer = create(:answer, question: question, points: '0', is_correct: false)
      right_answer = create(:answer, question: question, points: '3', is_correct: true)
      result = create(:result, answer: wrong_answer)

      expect(result.question_correct_answer).to eq right_answer
    end
  end
end
