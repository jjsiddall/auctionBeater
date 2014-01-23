class AddGoodpurchaseToVehicles < ActiveRecord::Migration
  def change
  	    add_column :vehicles, :good_purchase, :boolean, :default => false
  end
end
