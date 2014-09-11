class AddPermalink < ActiveRecord::Migration
  def change
    add_column :information, :permalink, :string
    add_column :categories, :permalink, :string
    add_column :features, :permalink, :string
  end
end
