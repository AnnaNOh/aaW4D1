class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.integer :user_id, null:false
      t.integer :artwork_id, null:false
      t.string :body
      t.timestamps
    end

    add_index :comments, :user_id
    add_index :comments, :artwork_id
    add_index :comments, [:user_id, :artwork_id]
  end
end
