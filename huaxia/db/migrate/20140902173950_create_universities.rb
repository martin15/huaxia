class CreateUniversities < ActiveRecord::Migration
  def change
    create_table :universities do |t|
      t.string    :name
      t.text      :address
      t.string    :phone
      t.string    :province
      t.string    :city
      t.text      :description
      t.string    :permalink
      t.timestamps
    end
  end
end
