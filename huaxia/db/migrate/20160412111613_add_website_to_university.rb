class AddWebsiteToUniversity < ActiveRecord::Migration
  def change
    add_column :universities, :website, :string
  end
end
