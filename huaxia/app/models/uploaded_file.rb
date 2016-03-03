class UploadedFile < ActiveRecord::Base
  attr_accessible :name, :permalink, :attachment

  has_attached_file :attachment
end
