class CreateRepoAndAdRepoId < ActiveRecord::Migration
  def change
    create_table :repos do |t|
      t.string :repo_url
    end
    rename_column :issues, :repo_url, :repo_id
  end
end
