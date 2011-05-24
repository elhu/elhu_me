class AddUniquenessToModels < ActiveRecord::Migration
  def self.up
    add_index :users, :handle, :unique => true
    add_index :categories, :name, :unique => true
  end

  def self.down
  end
end
