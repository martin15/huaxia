class AddDescriptionAndImageToFeatures < ActiveRecord::Migration
  def change
    add_column :features, :description, :text
    add_column :features, :feature_image_file_name, :string
    add_column :features, :feature_image_content_type, :string
    add_column :features, :feature_image_file_size, :integer
    add_column :features, :feature_image_updated_at, :datetime
  end
end
