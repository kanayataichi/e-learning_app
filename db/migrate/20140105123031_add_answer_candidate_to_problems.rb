class AddAnswerCandidateToProblems < ActiveRecord::Migration
  def change
    add_column :problems, :answer_candidate1, :string
    add_column :problems, :answer_candidate2, :string
    add_column :problems, :answer_candidate3, :string
    add_column :problems, :answer_candidate4, :string
  end
end
