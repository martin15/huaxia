class CreateStudentAssociations < ActiveRecord::Migration
  def change
    create_table :student_associations do |t|
      t.string    :name
      t.string    :city
      t.string    :url
      t.string    :logo_file_name
      t.string    :logo_content_type
      t.integer   :logo_file_size
      t.datetime  :logo_updated_at
      t.string    :permalink
      t.timestamps
    end
  end
end
