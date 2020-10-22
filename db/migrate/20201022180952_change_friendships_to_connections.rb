class ChangeFriendshipsToConnections < ActiveRecord::Migration[6.0]
  def change
    rename_table :friendships, :connections
  end
end
