class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :title
      t.text :description
      t.string :icon_image_file_name
      t.string :icon_image_content_type
      t.integer :icon_image_file_size
      t.datetime :icon_image_updated_at
      t.timestamps
    end
  end
end
