class AddOrderIdToStudentAssociation < ActiveRecord::Migration
  def change
    add_column :student_associations, :order_no, :integer, :default => 0
  end
end
