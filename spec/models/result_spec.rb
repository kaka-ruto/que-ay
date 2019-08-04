require 'rails_helper'

RSpec.describe Result, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:answer) }
  end

  describe '.question_text' do
    it 'returns the result question' do
      result = create(:result)

      expect(result.question_text).to eq 'For how long have you been investing?'
    end
  end

  describe '.correct_answer?' do
    it 'says if user got the answer or not' do
      result = create(:result)

      expect(result.answer_correct?).to eq true
    end
  end
end
