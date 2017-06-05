class CreatePics < ActiveRecord::Migration[4.2]
  def change
    create_table :pics do |t|
        t.references :product, index: true
        t.text :name

        t.timestamps null: false
      end
    add_foreign_key :pics, :products
  end
end
