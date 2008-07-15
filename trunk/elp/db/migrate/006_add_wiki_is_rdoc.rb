class AddWikiIsRdoc < ActiveRecord::Migration
  def self.up
    add_column :wikis,:is_rdoc,:boolean,:default=>false,:null=>true
  end

  def self.down
    remove_column :wikis,:is_rdoc
  end
end
