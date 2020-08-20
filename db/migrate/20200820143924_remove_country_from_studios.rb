class RemoveCountryFromStudios < ActiveRecord::Migration[6.0]
  def change
    remove_column :studios, :country, :string
  end
end
