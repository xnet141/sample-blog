class AddUsername < ActiveRecord::Migration[7.2]
  def up
    add_column :users, :username, :string#, :null=>true
  end
end
