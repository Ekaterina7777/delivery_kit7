class SetDefaultToUser < ActiveRecord::Migration[7.1]
  def up 
    change_column_default(:users, :role, 0)
    User.update_all role: 0
  end
  def down
    change_column_default(:users, :role, nil)
  end

end
