require "rails_helper"

RSpec.feature 'Answering questions', :type => :feature do
  before do
    create(:question, question: 'Are you an investor?')
    create(:question, question: 'How long have you invested?')
  end

  scenario 'User visits the homepage' do
    visit '/'

    expect(page).to have_text('Proposition')
    expect(page).to have_selector(:link_or_button, 'Take Questions')
  end

  scenario 'User clicks Take Questions button' do
    visit '/'

    click_button 'Take Questions'

    expect(page).to have_text('Are you an investor?')
    expect(page).to have_selector(:link_or_button, 'Next')
    expect(page).not_to have_selector(:link_or_button, 'Previous')
  end

  scenario 'User clicks Next button' do
    visit '/'

    click_button 'Take Questions'
    click_button 'Next'

    expect(page).to have_text 'How long have you invested?'
    expect(page).to have_selector(:link_or_button, 'Previous')
    expect(page).not_to have_selector(:link_or_button, 'Next')
  end
end