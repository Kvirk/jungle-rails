class Orders < ActiveRecord::Migration
  def change
    add_column :orders, :products, :string, array: true, default: []
  end
end
