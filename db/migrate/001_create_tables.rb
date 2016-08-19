class CreateTables < ActiveRecord::Migration
  def self.up
    create_table :deploy_votes do |t|
      t.column :issue_id, :integer
      t.column :user_id, :integer
      t.column :agreed, :boolean, default: true
    end
  end

  def self.down
    drop_table :deploy_votes
  end
end
