class AddProductOwner < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :owner, :string
  end
end
