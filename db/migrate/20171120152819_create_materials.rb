class CreateMaterials < ActiveRecord::Migration[5.0]
  def change
    create_table :materials do |t|
      t.references :user, foreign_key: true, index: true
      t.string :title
      t.string :category
      t.string :status
      t.string :address
      t.string :condition
      t.string :photo
      t.string :source
      t.string :supplier
      t.integer :price
      t.integer :quantity
      t.integer :lead_time

      t.timestamps
    end
  end
end
