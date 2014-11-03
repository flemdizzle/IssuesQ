class RemoveIssueFromIssue < ActiveRecord::Migration
  def change
   remove_column :issues, :issue, :string
  end
end
