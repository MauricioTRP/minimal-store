class AddDetailsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :rut, :string
    add_index :users, :rut, unique: true
    add_column :users, :name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone, :string
  end
end
