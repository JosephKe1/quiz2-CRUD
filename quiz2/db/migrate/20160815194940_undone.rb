class Undone < ActiveRecord::Migration[5.0]
  def change
    add_column :supports, :undone, :boolean 
  end
end
