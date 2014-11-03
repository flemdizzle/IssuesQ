class DropInstructors < ActiveRecord::Migration
  def change
    drop_table :instructors
    add_column :issues, :user_id, :integer
  end

end
