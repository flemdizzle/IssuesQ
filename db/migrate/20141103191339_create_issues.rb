class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :subject
      t.string :issue
      t.string :status
      t.integer :instructor_id
      t.integer :rank
      t.string :github

      t.timestamps
    end
  end
end
