class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :member_id
      t.integer :movement_id

      t.timestamps null: false
    end
    add_index :relationships, :movement_id
    add_index :relationships, :member_id
    add_index :relationships, [:movement_id, :member_id], unique: true
  end
end
