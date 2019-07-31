require 'rails_helper'

RSpec.describe Answer, type: :model do
  describe 'validations' do
    it {  should validate_presence_of(:answer) }
    it {  should validate_presence_of(:points) }
  end

  describe 'associations' do
    it { should belong_to(:question) }
  end
end
