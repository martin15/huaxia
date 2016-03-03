class CreateBookCategories < ActiveRecord::Migration
  def change
    create_table :book_categories do |t|
      t.string :name
      t.string :permalink
      t.timestamps
    end
  end
end
