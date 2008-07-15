class AddWikiIsNewsFlag < ActiveRecord::Migration
  def self.up
    add_column :wikis,:is_news,:boolean,:default=>false,:null=>true
  end

  def self.down
    remove_column :wikis,:is_news
  end
end
