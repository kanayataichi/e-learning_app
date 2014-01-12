class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.string :test_category_id
      t.integer :problem_no
      t.string :problem_content
      t.string :model_answer
      t.string :commentary
      t.references :test_category, null: false
      t.foreign_key :test_category, dependent: :delete

      t.timestamps
    end
  end
end
