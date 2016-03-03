class BookCategory < ActiveRecord::Base
  attr_accessible :name, :permalink
  has_permalink :name, :update => true

  has_many :books

  validates :name, :presence => true,
                   :length => {:minimum => 1, :maximum => 254}

  def self.list_type
     self.all.map{|x| [x.name, x.id]}
  end

end
