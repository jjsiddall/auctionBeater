class AddBasefieldsToVehicles < ActiveRecord::Migration
  def change
  	add_column :vehicles, :richie_id, :integer
    add_column :vehicles, :auction_location, :string
    add_column :vehicles, :auction_date, :date
    add_column :vehicles, :meter, :string
    add_column :vehicles, :price_usd, :string
    add_column :vehicles, :price_other, :string
  end
end
