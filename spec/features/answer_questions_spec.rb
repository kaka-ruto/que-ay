require "rails_helper"

RSpec.feature 'Answering questions', :type => :feature do
  let!(:first_question) { create(:question, question: 'Are you an investor?') }
  let!(:second_question) { create(:question,
                                  question: 'How long have you invested?') }
  let!(:wrong_answer_1) { create(:answer, question: first_question, answer: 'No',
                                          points: '0', is_correct: false) }
  let!(:right_answer_1) { create(:answer, question: first_question, answer: 'Yes',
                                          points: '3', is_correct: true) }
  let!(:right_answer_2) { create(:answer, question: second_question,
                                         answer: '10 years',
                                         points: '3', is_correct: true) }
  let!(:wrong_answer_2) { create(:answer, question: second_question,
                                         answer: '4 days', is_correct: false) }

  scenario 'User visits the homepage' do
    visit '/'

    expect(page).to have_text('Proposition')
    expect_to_have_button(text: 'Take Questions')
  end

  scenario 'User enters email' do
    visit '/'

    sign_in

    expect_to_have_question(text: first_question.question)
  end

  scenario 'User gets to the first question' do
    visit '/'

    sign_in

    expect_to_have_question(text: first_question.question)
    expect_to_have_answer(selector: 'div.ui.radio.checkbox',
                          text: wrong_answer_1.answer)
    expect_to_have_answer(selector: 'div.ui.radio.checkbox',
                          text: right_answer_1.answer)
    expect_to_have_button(text: 'Submit')
  end

  scenario 'User submits the first answer' do
    visit '/'

    sign_in
    answer_question 1

    expect_to_have_question(text: second_question.question)
    expect_to_have_answer(selector: 'div.ui.radio.checkbox',
                          text: right_answer_2.answer)
    expect_to_have_answer(selector: 'div.ui.radio.checkbox',
                          text: wrong_answer_2.answer)
    expect_to_have_button(text: 'Back')
    expect_to_have_button(text: 'Submit')
  end

  scenario 'User submits the last question' do
    visit '/'

    sign_in
    answer_question 1
    answer_question 3

    expect_to_have_question(text: first_question.question)
    expect_to_have_question(text: second_question.question)
    expect_to_have_scores
    expect_to_have_answer_statuses
  end

  def expect_to_have_question(text:)
    expect(page).to have_text text
  end

  def expect_to_have_answer(selector:, text:)
    expect(page).to have_selector(selector, text: text)
  end

  def expect_to_have_button(text:)
    expect(page).to have_selector(:link_or_button, text)
  end

  def expect_to_have_scores
    expect(page).to have_text wrong_answer_1.points
    expect(page).to have_text right_answer_2.points
  end

  def expect_to_have_answer_statuses
    expect(page).to have_css 'i.icon.checkmark'
    expect(page).to have_css 'i.icon.close'
  end

  def sign_in
    click_button 'Take Questions'
    fill_in 'user_email', with: 'user@email.com'
    click_button 'Submit'
  end

  def answer_question(id)
    choose "result_answer_id_#{id}"
    click_button 'Submit'
  end
end
