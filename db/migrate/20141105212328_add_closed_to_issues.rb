class AddClosedToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :closed, :string
  end
end
