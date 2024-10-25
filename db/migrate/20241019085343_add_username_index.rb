class AddUsernameIndex < ActiveRecord::Migration[7.2]
  def change
    add_index :users, :user, unique: true
  end
end
