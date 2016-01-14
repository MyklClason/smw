class CreateListingCategories < ActiveRecord::Migration
  def change
    create_table :listing_categories do |t|
      t.string :name
      t.timestamps
    end

    ["Free", "Preferred", "Premium"].each do |c|
      ListingCategory.create(:name => c)
    end
  end
end
