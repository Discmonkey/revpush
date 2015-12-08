class CreateMovements < ActiveRecord::Migration
  def change
    create_table :movements do |t|
      t.text :name
      t.text :desc
      t.float :zoom
      t.float :center_lat
      t.float :center_long
      t.string :movement_color
      t.float :movement_strength
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end

    add_index :movements, [:user_id, :created_at]
  end
end
