class AddCoordinatesToCats < ActiveRecord::Migration
  def change
    add_column :cats, :latitude, :float
    add_column :cats, :longitude, :float
  end
end
