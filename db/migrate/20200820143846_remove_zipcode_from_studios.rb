class RemoveZipcodeFromStudios < ActiveRecord::Migration[6.0]
  def change
    remove_column :studios, :zipcode, :integer
  end
end
