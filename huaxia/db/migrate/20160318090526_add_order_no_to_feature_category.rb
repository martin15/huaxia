class AddOrderNoToFeatureCategory < ActiveRecord::Migration
  def change
     add_column :feature_categories, :order_no, :integer, :default => 0
  end
end
