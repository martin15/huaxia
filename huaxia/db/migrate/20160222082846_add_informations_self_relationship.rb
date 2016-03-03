class AddInformationsSelfRelationship < ActiveRecord::Migration
  def change
    add_column :information, :parent_id, :integer
    add_column :information, :order_no, :integer
  end
end
