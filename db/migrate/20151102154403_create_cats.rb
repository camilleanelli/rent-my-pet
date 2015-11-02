class CreateCats < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.string :name
      t.string :description
      t.integer :price
      t.references :user, index: true, foreign_key: true
      t.string :gender
      t.boolean :availability
      t.string :race
      t.integer :age
      t.integer :zip_code
      t.string :city
      t.string :address

      t.timestamps null: false
    end
  end
end
