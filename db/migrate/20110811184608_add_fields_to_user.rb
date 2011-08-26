class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :uses_openauthenticator, :boolean, :default => false
    add_column :users, :account_token, :string
  end
end
