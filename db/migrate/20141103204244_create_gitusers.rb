class CreateGitusers < ActiveRecord::Migration
  def change
    create_table :gitusers do |t|
      t.string :user_id
      t.string :gituser_id
      t.string :gitname
    end
  end
end
