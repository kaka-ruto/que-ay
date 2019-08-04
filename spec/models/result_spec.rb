require 'rails_helper'

RSpec.describe Result, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:answer) }
  end

  describe '.question' do
    it 'returns the result question' do
      result = create(:result)

      expect(result.question_text).to be_a Question
    end
  end
end
