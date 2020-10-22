class ChangeFriendColumnToConnection < ActiveRecord::Migration[6.0]
  def change
    rename_column :connections, :friend_id, :contact_id
  end
end
