class AddAssociatonsBetweenUserAndPublication < ActiveRecord::Migration[5.2]
  def change
    add_reference :publications, :user
  end
end
