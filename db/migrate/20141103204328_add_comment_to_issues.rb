class AddCommentToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :comment, :string
  end
end
