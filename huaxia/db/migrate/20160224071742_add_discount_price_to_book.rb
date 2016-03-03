class AddDiscountPriceToBook < ActiveRecord::Migration
  def change
    add_column :books, :discount_price, :integer, :default => 0
  end
end
