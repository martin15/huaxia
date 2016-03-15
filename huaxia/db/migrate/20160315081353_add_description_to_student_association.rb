class AddDescriptionToStudentAssociation < ActiveRecord::Migration
  def change
    add_column :student_associations, :description, :text
  end
end
