class AddPriceToGame < ActiveRecord::Migration
  def change
    add_column :games, :price, :decimal
  end
end
