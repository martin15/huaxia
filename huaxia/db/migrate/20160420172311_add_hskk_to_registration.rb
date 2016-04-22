class AddHskkToRegistration < ActiveRecord::Migration
  def change
    add_column :registration_files, :hskk, :string
    add_column :registration_files, :hskk_level, :string
    add_column :registration_files, :hskk_score, :string
    add_column :registration_files, :hsk_score, :string
    add_column :registration_files, :phone, :string
  end
end
