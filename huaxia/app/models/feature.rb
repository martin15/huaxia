class Feature < ActiveRecord::Base
  attr_accessible :title, :short_description, :destination, :color

  validates :title, :presence => true,
            :length => {:minimum => 1, :maximum => 254}
  validates :short_description, :presence => true,
            :length => {:minimum => 1, :maximum => 300}
  validates :destination, :presence => true
  validates :color, :presence => true

end
