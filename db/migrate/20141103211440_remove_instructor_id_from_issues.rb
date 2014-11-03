class RemoveInstructorIdFromIssues < ActiveRecord::Migration
  def change
    remove_column :issues, :instructor_id, :integer
  end
end
