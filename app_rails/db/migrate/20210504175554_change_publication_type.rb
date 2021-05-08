class ChangePublicationType < ActiveRecord::Migration[5.2]
  def change
    remove_column :publications, :type, :string
    add_column :publications, :category, :string
  end
end
