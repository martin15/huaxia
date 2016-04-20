class AddSubMenuIcon2 < ActiveRecord::Migration
def change
    add_column :student_associations, :sub_menu_icon_file_name,    :string
    add_column :student_associations, :sub_menu_icon_content_type, :string
    add_column :student_associations, :sub_menu_icon_file_size,    :integer
    add_column :student_associations, :sub_menu_icon_updated_at,   :datetime

    add_column :book_categories, :sub_menu_icon_file_name,    :string
    add_column :book_categories, :sub_menu_icon_content_type, :string
    add_column :book_categories, :sub_menu_icon_file_size,    :integer
    add_column :book_categories, :sub_menu_icon_updated_at,   :datetime

    remove_column :books, :sub_menu_icon_file_name
    remove_column :books, :sub_menu_icon_content_type
    remove_column :books, :sub_menu_icon_file_size
    remove_column :books, :sub_menu_icon_updated_at
  end
end
