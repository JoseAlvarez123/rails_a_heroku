class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :puntaje
      t.string :titulo
      t.text :cuerpo

      t.timestamps
    end
  end
end
