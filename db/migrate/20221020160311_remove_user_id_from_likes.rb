class RemoveUserIdFromLikes < ActiveRecord::Migration[7.0]
  def change
    remove_column :likes, :user_id, :integer
  end
end
