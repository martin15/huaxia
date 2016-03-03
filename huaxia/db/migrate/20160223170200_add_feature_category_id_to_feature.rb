class AddFeatureCategoryIdToFeature < ActiveRecord::Migration
  def change
    add_column :features, :feature_category_id, :integer
  end
end
