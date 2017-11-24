class AddDescriptionToMaterials < ActiveRecord::Migration[5.0]
  def change
    add_column :materials, :description, :text
  end
end
