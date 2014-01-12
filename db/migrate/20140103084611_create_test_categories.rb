class CreateTestCategories < ActiveRecord::Migration
  def change
    create_table :test_categories do |t|
      t.string :test_category_id
      t.string :test_category_content

      t.timestamps
    end
  end
end
