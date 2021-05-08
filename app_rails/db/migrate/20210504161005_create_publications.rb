class CreatePublications < ActiveRecord::Migration[5.2]
  def change
    create_table :publications do |t|
      t.string :title
      t.string :animal_type
      t.string :type
      t.integer :price
      t.string :address

      t.timestamps
    end
  end
end
