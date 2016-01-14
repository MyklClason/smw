class AddColumnListingCategoryToListings < ActiveRecord::Migration
  def change
      add_column :listings, :listing_category_id, :integer
  end
end
