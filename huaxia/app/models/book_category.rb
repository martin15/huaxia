class BookCategory < ActiveRecord::Base
  attr_accessible :name, :permalink, :sub_menu_icon
  has_permalink :name, :update => true

  has_many :books

  has_attached_file :sub_menu_icon, :styles => { :icon => "50x50>" }

  validates :name, :presence => true,
                   :length => {:minimum => 1, :maximum => 254}

  def self.list_type
     self.all.map{|x| [x.name, x.id]}
  end

end
