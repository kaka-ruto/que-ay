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
      answer = create(:answer, question: question)

      expect(answer.question_text).to eq 'Have you had risks before?'
    end
  end
end
