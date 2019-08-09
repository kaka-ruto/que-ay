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
    it { should delegate_method(:body).to(:answer).with_prefix }
  end
end
