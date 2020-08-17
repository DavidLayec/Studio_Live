class CreateStudios < ActiveRecord::Migration[6.0]
  def change
    create_table :studios do |t|
      t.integer :price
      t.string :country
      t.integer :zipcode
      t.string :address
      t.float :longitude
      t.float :latitude
      t.string :title
      t.string :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
