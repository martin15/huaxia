class Category < ActiveRecord::Base
  attr_accessible :title, :description, :icon_image

  has_many :galleries

  has_attached_file :icon_image, :styles => { :big => "270x190>" }
  #validates_attachment_presence :icon_image

end
