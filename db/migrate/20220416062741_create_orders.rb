class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.date :order_date
      t.integer :status
      t.integer :customer_id
      t.float :total_price

      t.timestamps
    end
  end
end
