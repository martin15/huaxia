class Feature < ActiveRecord::Base
  attr_accessible :title, :short_description, :destination, :color, :permalink,
                  :description, :feature_image
  has_permalink :title, :update => true

  has_attached_file :feature_image, :styles => {:thumb => "200x200>", :medium => "400x400>",
                                                :large => "600x600>"
  }
  validates :title, :presence => true,
            :length => {:minimum => 1, :maximum => 254}
  validates :short_description, :presence => true,
            :length => {:minimum => 1, :maximum => 350}
  validates :color, :presence => true

end
