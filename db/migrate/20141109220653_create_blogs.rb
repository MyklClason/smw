class CreateBlogs < ActiveRecord::Migration
  def change
    if !Blog.table_exists?
      create_table :blogs do |t|
        t.string :title
        t.text :des
        t.string :created_by

        t.timestamps
      end
    end
  end
end
