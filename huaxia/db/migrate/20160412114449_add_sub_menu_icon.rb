class AddSubMenuIcon < ActiveRecord::Migration
  def change
    add_column :information, :sub_menu_icon_file_name,    :string
    add_column :information, :sub_menu_icon_content_type, :string
    add_column :information, :sub_menu_icon_file_size,    :integer
    add_column :information, :sub_menu_icon_updated_at,   :datetime

    add_column :features, :sub_menu_icon_file_name,    :string
    add_column :features, :sub_menu_icon_content_type, :string
    add_column :features, :sub_menu_icon_file_size,    :integer
    add_column :features, :sub_menu_icon_updated_at,   :datetime

    add_column :books, :sub_menu_icon_file_name,    :string
    add_column :books, :sub_menu_icon_content_type, :string
    add_column :books, :sub_menu_icon_file_size,    :integer
    add_column :books, :sub_menu_icon_updated_at,   :datetime

    add_column :airlines, :sub_menu_icon_file_name,    :string
    add_column :airlines, :sub_menu_icon_content_type, :string
    add_column :airlines, :sub_menu_icon_file_size,    :integer
    add_column :airlines, :sub_menu_icon_updated_at,   :datetime

    add_column :feature_categories, :sub_menu_icon_file_name,    :string
    add_column :feature_categories, :sub_menu_icon_content_type, :string
    add_column :feature_categories, :sub_menu_icon_file_size,    :integer
    add_column :feature_categories, :sub_menu_icon_updated_at,   :datetime
  end
end
