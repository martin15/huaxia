class Airline < ActiveRecord::Base
  attr_accessible :name, :permalink
  has_permalink :name, :update => true

  has_many :routes, :order => :origin

  validates :name, :presence => true,
                   :length => {:minimum => 1, :maximum => 254}
end
