class UniversityDetail < ActiveRecord::Base
  attr_accessible :title, :description, :order_no, :university_id

  belongs_to :university
end
