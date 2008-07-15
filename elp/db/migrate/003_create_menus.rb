class CreateMenus < ActiveRecord::Migration
  def self.up
    create_table :menus do |t|
      t.primary_key :id
      t.integer :parent_id
      t.string :shortname,:null=>false
      t.string :longname,:null=>true
      t.string :controller
      t.string :action
      t.string :parameters
      t.text :description,:null=>true
      t.datetime :create_dt,:null=>false
      t.integer :level,:null=>false
      t.timestamp
    end
  end

  def self.down
    drop_table :menus
  end
end
