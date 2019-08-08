require 'rails_helper'

RSpec.describe Result, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:answer) }
  end

  describe 'delegates' do
    it { should delegate_method(:points).to(:answer).with_prefix }
    it { should delegate_method(:is_correct).to(:answer).with_prefix }
    it { should delegate_method(:correct_answer).to(:answer) }
  end

  describe '.question_text' do
    it 'returns the question text' do
      result = create(:result)

      expect(result.question_text).to eq 'For how long have you been investing?'
    end
  end

  describe '.answer_text' do
    it 'returns the answer text' do
      answer = create(:answer, answer: 'Not really')
      result = create(:result, answer: answer)

      expect(result.answer_text).to eq 'Not really'
    end
  end
end
