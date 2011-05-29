class AddSlugUniquenesToCategoriesAndBlogs < ActiveRecord::Migration
  def self.up
    add_index :blogs, :slug, :unique => true
    add_index :categories, :slug, :unique => true
  end

  def self.down
  end
end
