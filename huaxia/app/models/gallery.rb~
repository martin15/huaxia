class Gallery < ActiveRecord::Base
  attr_accessible :title, :description, :gallery_image, :category_id

  belongs_to :category

  has_attached_file :gallery_image, :styles => { :thumb => "100x100>", :big => "800x800>" }
  validates_attachment_presence :gallery_image
end
