class AddDisplayAtHomeForFeatures < ActiveRecord::Migration
  def change
    add_column :features, :display_at_home, :boolean
  end
end
