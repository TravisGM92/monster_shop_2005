class ChangeDataTypeForOrderStatus < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :status
    add_column :orders, :status, :integer, default: 0 
  end
end
