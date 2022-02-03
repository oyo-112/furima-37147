class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :nickname, :string
    add_column :users, :family_name, :string
    add_column :users, :family_name_kana, :string
    add_column :users, :given_name, :string
    add_column :users, :given_name_kana, :string
    add_column :users, :birthday, :date
  end
end
