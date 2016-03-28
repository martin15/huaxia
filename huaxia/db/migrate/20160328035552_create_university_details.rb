class CreateUniversityDetails < ActiveRecord::Migration
  def change
    create_table :university_details do |t|
      t.string  :title
      t.text    :description
      t.integer :order_no, :default => 0
      t.integer :university_id
      t.timestamps
    end
  end
end
