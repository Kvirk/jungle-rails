class OrdersDelete < ActiveRecord::Migration
  def change
    remove_column :orders, :products, :string, array: true, default: []
  end
end
