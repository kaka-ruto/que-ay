class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.references :question
      t.string :answer
      t.string :points, default: '0'
      t.boolean :is_correct, default: false

      t.timestamps
    end
  end
end
