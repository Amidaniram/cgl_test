class AddLowerUsernameToUser < ActiveRecord::Migration
  def change
    add_column :users, :lower_username, :string
  end
end
