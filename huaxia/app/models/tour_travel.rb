class TourTravel < ActiveRecord::Base
  attr_accessible :title, :content, :permalink, :parent_id, :order_no, :brochure, :menu_icon

  has_permalink :title, :update => true
  has_many :child_info, :class_name => "TourTravel", :foreign_key => :parent_id, :order => "order_no"

  belongs_to :parent_info, :class_name => "TourTravel", :foreign_key => :parent_id

  has_attached_file :menu_icon, :styles => { :icon => "50x50>" }
  has_attached_file :brochure, :styles => { :medium => "200x200>" }

  validates :title, :presence => true, :uniqueness => true

  scope :parent_tour_travel, where("parent_id is null")

  def is_parent?
    return self.parent_id.nil?
  end
end
