# frozen_string_literal: true

# Generate initial questions

questions = [
  'Do you have experience with investments involving risks not covered by a guarantee scheme?',
  'Hypothetically, if you had EUR 10.000 total to invest in crowdfunding projects, what would be most advisable to do?',
  'Which statement applies to your income?'
]

  questions.map do |question|
    Question.create(question: question)
  end
