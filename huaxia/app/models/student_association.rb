class StudentAssociation < ActiveRecord::Base
  attr_accessible :name, :city, :url, :permalink, :logo, :description, :order_no, :sub_menu_icon
  has_permalink :name, :update => true

  has_attached_file :logo, :styles => { :thumb => "100x100>",
                                        :medium => "350x350",
                                        :big => "500x500" }
has_attached_file :sub_menu_icon, :styles => { :icon => "50x50>" }

  def logo_position
    return "" unless self.logo.exists?
    geo = Paperclip::Geometry.from_file(self.logo.to_file(:medium))
    h = geo.height
    w = geo.width
    if w < h
      "small-center-image"
    end
  end

  def self.default
    StudentAssociation.order(:order_no).first
  end

end
