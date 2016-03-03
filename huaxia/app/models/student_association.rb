class StudentAssociation < ActiveRecord::Base
  attr_accessible :name, :city, :url, :permalink, :logo
  has_permalink :name, :update => true

  has_attached_file :logo, :styles => { :thumb => "100x100>",
                                        :medium => "350x350",
                                        :big => "500x500" }


end
