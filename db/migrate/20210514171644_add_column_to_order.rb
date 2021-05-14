class AddColumnToOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :orders ,:product_id, :integer
    add_column :orders ,:address, :text
  end
end
