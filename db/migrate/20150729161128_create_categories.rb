class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.timestamps
    end

    ["Free", "Expensive", "Most Expensive"].each do |c|
      Category.create(:name => c)
    end
  end
end
