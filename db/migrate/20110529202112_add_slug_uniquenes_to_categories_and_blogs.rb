class AddSlugUniquenesToCategoriesAndBlogs < ActiveRecord::Migration
  def self.up
    add_index :blogs, :slug, :unique => true
  end

  def self.down
  end
end
