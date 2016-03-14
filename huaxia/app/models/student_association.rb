class StudentAssociation < ActiveRecord::Base
  attr_accessible :name, :city, :url, :permalink, :logo
  has_permalink :name, :update => true

  has_attached_file :logo, :styles => { :thumb => "100x100>",
                                        :medium => "350x350",
                                        :big => "500x500" }


  def logo_position
    return "" unless self.logo.exists?
    geo = Paperclip::Geometry.from_file(self.logo.to_file(:medium))
    h = geo.height
    w = geo.width
    if w < h
      "small-center-image"
    end
  end
end
