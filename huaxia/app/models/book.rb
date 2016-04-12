class Book < ActiveRecord::Base
  attr_accessible :name, :price, :description, :available, :book_image, :permalink,
                  :book_type, :discount_price, :book_category_id, :sub_menu_icon
  has_permalink :name, :update => true

  has_attached_file :book_image, :styles => { :thumb => "100x100>",
                                              :medium => "200x200",
                                              :big => "400x400" }

  has_attached_file :sub_menu_icon, :styles => { :icon => "50x50>" }
  
  belongs_to :book_category

  validates_attachment_presence :book_image
  validates :name, :presence => true,
                   :length => {:minimum => 1, :maximum => 254}
  validates :price, :presence => true,
                    :numericality => true
  validates :description, :presence => true

  TYPE = {
    :bahan_ajar_tk => "Bahan Ajar TK",
    :bahan_ajar_sd => "Bahan Ajar SD",
    :bahan_ajar_smp_sma => "Bahan Ajar SMP SMA",
    :bahan_ajar_umum => "Bahan Ajar Umum",
    :buku_umum => "Buku Umum",
    :kamus => "Kamus",
    :dan_lain_lain => "YCT & HSK",
  }

  def self.list_type
    [[Book::TYPE[:bahan_ajar_tk], "bahan_ajar_tk"],
     [Book::TYPE[:bahan_ajar_sd], "bahan_ajar_sd"],
     [Book::TYPE[:bahan_ajar_smp_sma], "bahan_ajar_smp_sma"],
     [Book::TYPE[:bahan_ajar_umum], "bahan_ajar_umum"],
     [Book::TYPE[:buku_umum], "buku_umum"],
     [Book::TYPE[:kamus], "kamus"],
     [Book::TYPE[:dan_lain_lain], "dan_lain_lain"]]
  end

  def self.discount_book
    self.where("discount_price > 0")
  end

  def available?
    return self.available ? "Yes" : "No"
  end
end
