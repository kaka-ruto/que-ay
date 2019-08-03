require "rails_helper"

RSpec.feature 'Answering questions', :type => :feature do
  before do
    create(:question, question: 'Are you an investor?')
    create(:question, question: 'How long have you invested?')
    create(:answer, question_id: 1, answer: 'No', points: '0', is_correct: false)
    create(:answer, question_id: 2, answer: '10 years', points: '3', is_correct: true)
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
    expect(page).to have_selector('div.ui.radio.checkbox', text: 'No')
    expect(page).not_to have_selector('div.ui.radio.checkbox', text: '10 years')
    expect(page).to have_selector(:link_or_button, 'Next')
    expect(page).not_to have_selector(:link_or_button, 'Previous')
  end

  scenario 'User clicks Next button' do
    visit '/'

    click_button 'Take Questions'
    click_button 'Next'

    expect(page).to have_text 'How long have you invested?'
    expect(page).to have_selector('div.ui.radio.checkbox', text: '10 years')
    expect(page).not_to have_selector('div.ui.radio.checkbox', text: 'No')
    expect(page).to have_selector(:link_or_button, 'Previous')
    expect(page).not_to have_selector(:link_or_button, 'Next')
  end

  scenario 'User gets to the last question' do
    visit '/'

    click_button 'Take Questions'
    click_button 'Next'

    expect(page).to have_selector(:link_or_button, 'Submit')
  end

  scenario 'User clicks Submit to submit answers' do
    visit '/'

    click_button 'Take Questions'
    choose 'No'
    click_button 'Next'
    find('div.ui.radio.checkbox', text: '10 years').click
    click_button 'Submit'

    expect(page).to have_text('Results')
  end
end
