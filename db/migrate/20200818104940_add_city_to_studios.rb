class AddCityToStudios < ActiveRecord::Migration[6.0]
  def change
    add_column :studios, :city, :string
  end
end
