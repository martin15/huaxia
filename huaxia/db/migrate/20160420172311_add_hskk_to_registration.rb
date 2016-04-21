class AddHskkToRegistration < ActiveRecord::Migration
  def change
    add_column :registration_files, :hskk, :string
    add_column :registration_files, :hskk_level, :string
  end
end
