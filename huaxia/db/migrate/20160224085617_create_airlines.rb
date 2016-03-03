class CreateAirlines < ActiveRecord::Migration
  def change
    create_table :airlines do |t|
      t.string  :name
      t.string  :permalink
      t.timestamps
    end
  end
end
