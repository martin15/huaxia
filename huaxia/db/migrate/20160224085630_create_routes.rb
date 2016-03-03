class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.string  :origin
      t.text    :transit
      t.string  :destination
      t.string  :estimation_price
      t.string  :estimation_time
      t.text    :note
      t.integer :airline_id
      t.timestamps
    end
  end
end
