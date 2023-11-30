class CreateCataloges < ActiveRecord::Migration[7.1]
  def change
    create_table :cataloges do |t|
      t.string :title

      t.timestamps
    end
  end
end
