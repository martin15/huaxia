class AddLogoToAirlines < ActiveRecord::Migration
  def change
    add_column :airlines, :logo_file_name,    :string
    add_column :airlines, :logo_content_type, :string
    add_column :airlines, :logo_file_size,    :integer
    add_column :airlines, :logo_updated_at,   :datetime
  end
end
