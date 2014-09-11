class University < ActiveRecord::Base
  attr_accessible :name, :address, :phone, :province, :city, :description, :permalink
  has_permalink :name, :update => true

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
