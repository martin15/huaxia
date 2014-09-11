class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string    :name
      t.text      :description
      t.integer   :price
      t.boolean   :available
      t.string    :book_image_file_name
      t.string    :book_image_content_type
      t.integer   :book_image_file_size
      t.datetime  :book_image_updated_at
      t.string    :permalink
      t.timestamps
    end
  end
end
