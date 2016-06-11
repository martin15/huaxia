class Airline < ActiveRecord::Base
  attr_accessible :name, :permalink, :sub_menu_icon, :logo
  has_permalink :name, :update => true

  has_many :routes, :order => :origin

  has_attached_file :sub_menu_icon, :styles => { :icon => "50x50>" }
  has_attached_file :logo, :styles => { :small => "100x100>", :medium => "200x200>" }

  validates :name, :presence => true,
                   :length => {:minimum => 1, :maximum => 254}
end
