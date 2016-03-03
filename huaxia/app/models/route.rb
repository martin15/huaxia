class Route < ActiveRecord::Base
  attr_accessible :origin, :transit, :destination, :estimation_price, :estimation_time,
                  :note, :airline_id

  belongs_to :airline

  validates :origin, :presence => true,
                     :length => {:minimum => 1, :maximum => 254}
  validates :destination, :presence => true,
                          :length => {:minimum => 1, :maximum => 254}
end
