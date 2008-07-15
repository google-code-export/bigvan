class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.primary_key :id
      t.string :user_name,:null=>false
      t.datetime :last_login_dt,:null=>false
      t.datetime :create_dt,:null=>false
      t.integer :level,:null=>false
      t.timestamp
    end
  end

  def self.down
    drop_table :accounts
  end
end
