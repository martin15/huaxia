class Testimonial < ActiveRecord::Base
  attr_accessible :from, :email, :comment, :picture
  has_attached_file :picture, :styles => { :thumb => "100>x100", :medium => "200>x200",
                                           :big => "400x400>" }

  validates :from, :presence => true,
            :length => {:minimum => 1, :maximum => 254},
            :format => {:with => /[a-zA-Z\s]+$/}
  validates :email, :presence => true,
            :length => {:minimum => 3, :maximum => 254},
            :uniqueness => true,
            :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}
  validates :comment, :presence => true
  validates_attachment_presence :picture

end
