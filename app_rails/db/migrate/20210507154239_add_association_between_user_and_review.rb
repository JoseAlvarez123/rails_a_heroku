class AddAssociationBetweenUserAndReview < ActiveRecord::Migration[5.2]
  def change
    remove_reference :reviews, :user, index: true
    add_reference :reviews, :reviewer, index: true
    add_reference :reviews, :reviewed, index: true
  end
end
