class ChangeUserRequestBoolean < ActiveRecord::Migration[5.2]
  def change
    remove_column :user_requests, :accepted, :boolean, default: false
    add_column :user_requests, :status, :integer, default: 0
  end
end
