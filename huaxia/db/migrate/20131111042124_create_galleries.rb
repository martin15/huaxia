class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :title
      t.text :description
      t.string :gallery_image_file_name
      t.string :gallery_image_content_type
      t.integer :gallery_image_file_size
      t.datetime :gallery_image_updated_at
      t.integer :category_id
      t.timestamps
    end
  end
end
