class Category < ActiveRecord::Base
  attr_accessible :title, :description, :icon_image, :permalink, :category_type
  has_permalink :title, :update => true

  has_many :galleries, :dependent => :destroy

  has_attached_file :icon_image, :styles => { :big => "270x190>" }
  #validates_attachment_presence :icon_image

  TYPE = {
      :city => "City",
      :university => "University",
      :huaxia_program => "HUAXIA Program"
    }
  def self.list_type
    [[Category::TYPE[:city], "city"],
     [Category::TYPE[:university], "university"],
     [Category::TYPE[:huaxia_program], "huaxia_program"]]
  end
end
