class RenameNameToUsers < ActiveRecord::Migration

  # rename_column テーブル名, 旧カラム名, 新カラム名
  def change
    rename_column :users, :name, :user_name
  end
end
