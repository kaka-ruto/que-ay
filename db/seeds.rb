# frozen_string_literal: true

# Generate initial questions

data = [
  {
    question: 'Do you have experience with investments involving risks not covered by a guarantee scheme?',
    answers: [
      {
        answer: 'Yes',
        points: '3',
        is_correct: true
      },
      {
        answer: 'No',
        points: '0',
        is_correct: false
      }
    ]
  },
  {
    question: 'Hypothetically, if you had EUR 10.000 total to invest in crowdfunding projects, what would be most advisable to do?',
    answers: [
      {
        answer: 'Invest all 10.000 in one company with a low-risk profile',
        points: '0',
        is_correct: false
      },
      {
        answer: 'Invest a responsible amount across multiple companies',
        points: '3',
        is_correct: true
      }
    ]
  },
  {
    question: 'Which statement applies to your income?',
    answers: [
      {
        answer: 'I have just enough money to get to the end of each month',
        points: '0',
        is_correct: false
      },
      {
        answer: 'I have money to spare at the end of each month',
        points: '3',
        is_correct: true
      },
      {
        answer: "I don't always have enough money to get to the end of each month",
        points: '0',
        is_correct: false
      }
    ]
  }
]

data.each do |que_ay|
  que = Question.create(question: que_ay[:question])

  que_ay[:answers].each do |que_answers|
    ans = que.answers.build(answer: que_answers[:answer], points: que_answers[:points], is_correct: que_answers[:is_correct])
    ans.save
  end
end
