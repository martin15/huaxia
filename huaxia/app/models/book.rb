class Book < ActiveRecord::Base
  attr_accessible :name, :price, :description, :available, :book_image, :permalink
  has_permalink :name, :update => true

  has_attached_file :book_image, :styles => { :thumb => "100x100>",
                                              :medium => "200x200",
                                              :big => "400x400" }
  validates_attachment_presence :book_image
  validates :name, :presence => true,
                   :length => {:minimum => 1, :maximum => 254}
  validates :price, :presence => true,
                    :numericality => true
  validates :description, :presence => true

end
