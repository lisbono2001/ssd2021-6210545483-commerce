class AddColumnsToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :stock, :integer
    add_column :products, :sold, :integer
    add_column :products, :status, :string
  end
end
