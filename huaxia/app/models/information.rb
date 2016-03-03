class Information < ActiveRecord::Base
  attr_accessible :title, :content, :permalink, :parent_id, :order_no
  has_permalink :title, :update => true
  has_many :child_info, :class_name => "Information", :foreign_key => :parent_id, :order => "order_no"
  belongs_to :parent_info, :class_name => "Information", :foreign_key => :parent_id

  scope :showed_informations, where("title not in ('about_us', 'book_note',
                                      'study-in-china', 'study_in_china')")

  validates :title, :presence => true, :uniqueness => true

  def is_parent?
    puts self.parent_id.nil?
    return self.parent_id.nil?
  end
end
