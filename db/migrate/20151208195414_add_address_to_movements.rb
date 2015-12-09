class AddAddressToMovements < ActiveRecord::Migration
  def change
    add_column :movements, :Address, :string
  end
end
