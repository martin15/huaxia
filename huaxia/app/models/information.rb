class Information < ActiveRecord::Base
  attr_accessible :title, :content, :permalink
  has_permalink :title, :update => true

  scope :showed_informations, where("title not in ('about_us', 'book_note',
                                      'study-in-china', 'study_in_china')")
end
