class ChangePriceInVehicles < ActiveRecord::Migration
  def change
  	change_column :vehicles, :price_usd, :integer
  	change_column :vehicles, :price_other, :integer
  end
end
