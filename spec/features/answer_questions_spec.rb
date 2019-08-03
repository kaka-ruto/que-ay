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

  scenario 'User enters email' do
    visit '/'

    click_button 'Take Questions'
    fill_in 'user_email', with: 'user@email.com'
    click_button 'Submit'

    expect(page).to have_text 'Are you an investor?'
  end

  scenario 'User starts answering questions' do
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

  scenario 'User submits the first answer' do
    visit '/'

    click_button 'Take Questions'
    choose 'result_answer_id_1'
    click_button 'Submit'

    expect(page).to have_text 'How long have you invested?'
  end

  scenario 'User submits last answer' do
    visit '/'

    click_button 'Take Questions'
    choose 'result_answer_id_1'
    click_button 'Submit'
    choose 'result_answer_id_2'
    click_button 'Submit'

    expect_page_to_have_questions
    expect_page_to_have_answers
    expect_page_to_have_scores
    # expect_page_to_show_correct_or_wrong_answers
  end

  def expect_page_to_have_questions
    expect(page).to have_text 'Are you an investor?'
  end

  def expect_page_to_have_answers
    expect(page).to have_text 'No'
  end

  def expect_page_to_have_scores
    expect(page).to have_text '3'
  end
end
