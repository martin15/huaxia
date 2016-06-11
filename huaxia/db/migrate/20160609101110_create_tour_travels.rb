class CreateTourTravels < ActiveRecord::Migration
  def change
    create_table :tour_travels do |t|
      t.string    :title
      t.text      :content
      t.string    :permalink
      t.integer   :parent_id
      t.integer   :order_no
      t.string    :brochure_file_name
      t.string    :brochure_content_type
      t.integer   :brochure_file_size
      t.datetime  :brochure_updated_at
      t.string    :menu_icon_file_name
      t.string    :menu_icon_content_type
      t.integer   :menu_icon_file_size
      t.datetime  :menu_icon_updated_at
      t.timestamps
    end
  end
end
