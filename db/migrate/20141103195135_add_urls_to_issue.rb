class AddUrlsToIssue < ActiveRecord::Migration
  def change
   remove_column :issues, :github, :string
   add_column :issues, :repo_url, :string
   add_column :issues, :issue_url, :string
  end
end
