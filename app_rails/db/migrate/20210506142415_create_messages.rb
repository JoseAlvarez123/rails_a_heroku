class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.references :sender, index: true
      t.references :reciever, index: true
      t.string :content

      t.timestamps
    end
  end
end
