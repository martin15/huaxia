class AddColumnToRegistrationForm < ActiveRecord::Migration
  def change
    add_column :registration_files, :major_2, :string
    add_column :registration_files, :toefl, :string
  end
end
