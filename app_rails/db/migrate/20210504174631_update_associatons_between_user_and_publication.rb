class UpdateAssociatonsBetweenUserAndPublication < ActiveRecord::Migration[5.2]
  def change
    remove_reference :publications, :user
    add_reference :publications, :user, index: true
  end
end
