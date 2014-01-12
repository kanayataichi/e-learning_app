class CreateLearningHistories < ActiveRecord::Migration
  def change
    create_table :learning_histories do |t|
      t.string :learner_id
      t.string :learning_date
      t.string :test_category_id
      t.integer :problem_no
      t.integer :item_number
      t.string :answer_content
      t.integer :judgement_result

      t.timestamps
    end
  end
end
