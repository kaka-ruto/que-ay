require "rails_helper"

RSpec.feature 'Answering questions', :type => :feature do
  scenario 'User visits the homepage' do
    visit '/'

    expect(page).to have_text('Proposition')
  end
end
