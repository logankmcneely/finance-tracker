class RemoveLastPriceFromStockTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :stocks, :last_price
  end
end
