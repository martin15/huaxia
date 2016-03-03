class CreateFeatureCategories < ActiveRecord::Migration
  def change
    create_table :feature_categories do |t|
      t.string  :name
      t.string  :color
      t.string  :permalink
      t.timestamps
    end
  end
end
