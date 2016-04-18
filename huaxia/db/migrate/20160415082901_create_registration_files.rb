class CreateRegistrationFiles < ActiveRecord::Migration
  def change
    create_table :registration_files do |t|
      t.string    :sender_name
      t.string    :email
      t.string    :attachment_file_name
      t.string    :attachment_content_type
      t.integer   :attachment_file_size
      t.datetime  :attachment_updated_at
      t.string    :permalink
      t.timestamps
    end
  end
end
