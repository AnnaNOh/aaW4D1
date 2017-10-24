class AddUserConstraints2 < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :username, :string, unique: true, null: false
  end
end
