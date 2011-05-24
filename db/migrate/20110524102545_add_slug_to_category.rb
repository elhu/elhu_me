class AddSlugToCategory < ActiveRecord::Migration
  def self.up
    add_column :categories, :slug, :string
    add_index :categories, :slug, :unique => true
  end

  def self.down
    remove_column :categories, :slug
  end
end
