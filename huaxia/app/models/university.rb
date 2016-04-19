class University < ActiveRecord::Base
  attr_accessible :name, :address, :phone, :province, :city, :description, :permalink,
                  :logo_image, :website
  has_permalink :name, :update => true
  has_many :university_details
  has_many :registrations_univ_1, :class_name => "RegistrationFile", :foreign_key => :university_1
  has_many :registrations_univ_2, :class_name => "RegistrationFile", :foreign_key => :university_2
  has_attached_file :logo_image,
                    :styles => { :thumb => "100>x100", :medium => "200x200>" }

  validates :name, :presence => true,
                   :length => {:minimum => 1, :maximum => 254}
  validates :address, :presence => true,
                      :length => {:minimum => 1, :maximum => 254}
  validates :province, :presence => true,
                       :length => {:minimum => 1, :maximum => 254}
  validates :city, :presence => true,
                   :length => {:minimum => 1, :maximum => 254}
  validates :description, :presence => true

  def self.university_list
    array = []
    self.order("city").group_by{ |h| h.city }.each do |city|
      cities = []
      cities << city[0]
      temp_univ = []
      city[1].each do |univ|
        temp_univ << [univ.name, univ.id]
      end
      cities << temp_univ
      array << cities
    end
    return array
  end
end
