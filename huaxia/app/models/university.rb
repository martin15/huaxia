class University < ActiveRecord::Base
  attr_accessible :name, :address, :phone, :province, :city, :description, :permalink,
                  :logo_image
  has_permalink :name, :update => true
  has_attached_file :logo_image,
                    :styles => { :thumb => "100>x100", :medium => "200x200>" }

  validates :name, :presence => true,
                   :length => {:minimum => 1, :maximum => 254}
  validates :address, :presence => true,
                      :length => {:minimum => 1, :maximum => 254}
  validates :province, :presence => true,
                       :length => {:minimum => 1, :maximum => 254}
  validates :city, :presence => true,
                   :length => {:minimum => 1, :maximum => 254}
  validates :description, :presence => true
end
