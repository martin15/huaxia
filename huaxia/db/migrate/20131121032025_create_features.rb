class CreateFeatures < ActiveRecord::Migration
  def change
    create_table :features do |t|
      t.string :title
      t.text :short_description
      t.string :destination
      t.string :color
      t.timestamps
    end
  end
end
