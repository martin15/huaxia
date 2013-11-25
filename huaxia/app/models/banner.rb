class Banner < ActiveRecord::Base
  attr_accessible :link, :banner_image

  has_attached_file :banner_image, :styles => { :thumb => "200x200>", :medium => "400x400>",
                                                :big => "850x800>" }
  validates_attachment_presence :banner_image
end
