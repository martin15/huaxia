class Feature < ActiveRecord::Base
  attr_accessor :delete_image
  attr_accessible :title, :short_description, :destination, :color, :permalink, :display_at_home,
                  :description, :feature_image, :feature_category_id, :delete_image, :order_no
  has_permalink :title, :update => true

  has_many :child_features, :class_name => "Feature", :foreign_key => :parent_id
  belongs_to :parent_feature, :class_name => "Feature", :foreign_key => :parent_id
  belongs_to :feature_category

  has_attached_file :feature_image, :styles => {:thumb => "200x200>", :medium => "400x400>",
                                                :large => "600x600>"
  }
  validates :title, :presence => true,
            :length => {:minimum => 1, :maximum => 254}

end
