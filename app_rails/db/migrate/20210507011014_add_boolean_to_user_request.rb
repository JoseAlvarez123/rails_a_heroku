class AddBooleanToUserRequest < ActiveRecord::Migration[5.2]
  def change
    add_column :user_requests, :accepted, :boolean, default: false
  end
end
