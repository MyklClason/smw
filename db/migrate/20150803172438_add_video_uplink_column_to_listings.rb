class AddVideoUplinkColumnToListings < ActiveRecord::Migration
  def change
    add_column :listings, :video_uplink, :string
  end
end
