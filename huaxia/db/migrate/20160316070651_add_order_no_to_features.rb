class AddOrderNoToFeatures < ActiveRecord::Migration
  def change
    add_column :features, :order_no, :integer, :default => 0
  end
end
