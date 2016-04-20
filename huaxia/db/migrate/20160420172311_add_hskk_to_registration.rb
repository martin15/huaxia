class AddHskkToRegistration < ActiveRecord::Migration
  def change
    add_column :registration_files, :hskk, :string
  end
end
