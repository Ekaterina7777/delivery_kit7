class CreateCards < ActiveRecord::Migration[7.1]
  def change
    create_table :cards do |t| 
      t.integer :product_id
      t.integer :user_id
      t.integer :count

      t.timestamps
    end
    add_index :cards, :user_id
  end
end
