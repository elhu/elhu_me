class AddSlugToBlog < ActiveRecord::Migration
  def self.up
    add_column :blogs, :slug, :string
  end

  def self.down
    remove_column :blogs, :slug
  end
end
