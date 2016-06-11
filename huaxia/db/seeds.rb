# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
username = User.find_or_create_by_email(:email => "martin.me15@yahoo.com",
                                        :password => "1q2w3e4r5t",
                                        :password_confirmation => "1q2w3e4r5t")
puts username.inspect

username2 = User.find_or_create_by_email(:email => "huaxia.icec@gmail.com",
                                        :password => "1q2w3e4r5t",
                                        :password_confirmation => "1q2w3e4r5t")
puts username2.inspect

about_us = Information.find_by_title("about_us")
about_us.update_attribute(:title, "About Us") unless about_us.nil?
about_us = Information.find_or_create_by_title(:title => "About Us")
puts about_us.inspect

short_gxnu = Information.find_by_title("short_gxnu")
short_gxnu.update_attribute(:title, "Short Us") unless short_gxnu.nil?
short_gxnu = Information.find_or_create_by_title(:title => "Short gxnu")
puts short_gxnu.inspect

#study_at_china = Information.find_or_create_by_title(:title => "study_at_china")
study_at_china = Information.find_by_title("study_in_china")
study_at_china.update_attributes(:title =>"Study in China") unless study_at_china.nil?
study_at_china = Information.find_or_create_by_title(:title => "Study in China")
puts study_at_china.inspect

learning_mandarin = Information.find_by_title("learning_mandarin")
learning_mandarin.update_attribute(:title, "Learning Mandarin") unless learning_mandarin.nil?
learning_mandarin = Information.find_or_create_by_title(:title => "Learning Mandarin")
puts learning_mandarin.inspect

tour_and_travel = Information.find_or_create_by_title(:title => "Tour and Travel")
puts tour_and_travel.inspect

tiket_pesawat = Information.find_or_create_by_title(:title => "Tiket Pesawat", :parent_id => tour_and_travel.id)
puts tiket_pesawat.inspect

hsk = Information.find_or_create_by_title(:title => "hsk")
puts hsk.inspect

book_note = Information.find_or_create_by_title(:title => "book_note")
puts book_note.inspect

guilin = Category.find_or_create_by_title(:title => "guilin")
puts guilin.inspect

gxnu = Category.find_or_create_by_title(:title => "GXNU")
puts gxnu.inspect

student_activity = Category.find_or_create_by_title(:title => "student_activity")
puts student_activity.inspect

summer_winter_camp = Category.find_or_create_by_title(:title => "summer_winter_camp")
puts summer_winter_camp.inspect


tour_and_travel = Information.find_by_permalink("tour-and-travel")
child_tour_and_travels = tour_and_travel.child_info
child_tour_and_travels.each do |child_tour_and_travel|
  puts TourTravel.find_by_permalink(child_tour_and_travel.permalink).inspect
  puts "-----"
  if TourTravel.find_by_permalink(child_tour_and_travel.permalink).nil?
    tour_travel = TourTravel.new
    tour_travel.title = child_tour_and_travel.title
    tour_travel.content = child_tour_and_travel.content
    tour_travel.order_no = child_tour_and_travel.order_no
    tour_travel.menu_icon = child_tour_and_travel.sub_menu_icon
    tour_travel.save
    puts tour_travel.inspect
  end
end

bahan_ajar_tk = BookCategory.find_or_create_by_name(:name => "Bahan Ajar TK")
puts bahan_ajar_tk
bahan_ajar_tk_books = Book.where("book_type = 'bahan_ajar_tk'").update_all(:book_category_id => bahan_ajar_tk.id)

bahan_ajar_sd = BookCategory.find_or_create_by_name(:name => "Bahan Ajar SD")
puts bahan_ajar_sd
bahan_ajar_sd_books = Book.where("book_type = 'bahan_ajar_sd'").update_all(:book_category_id => bahan_ajar_sd.id)

bahan_ajar_smp_sma = BookCategory.find_or_create_by_name(:name => "Bahan Ajar SMP SMA")
puts bahan_ajar_smp_sma
bahan_ajar_smp_sma_books = Book.where("book_type = 'bahan_ajar_smp_sma'").update_all(:book_category_id => bahan_ajar_smp_sma.id)

bahan_ajar_umum = BookCategory.find_or_create_by_name(:name => "Bahan Ajar Umum")
puts bahan_ajar_umum
bahan_ajar_umum_books = Book.where("book_type = 'bahan_ajar_umum'").update_all(:book_category_id => bahan_ajar_umum.id)

buku_umum = BookCategory.find_or_create_by_name(:name => "Buku Umum")
puts buku_umum
buku_umum_books = Book.where("book_type = 'buku_umum'").update_all(:book_category_id => buku_umum.id)

kamus = BookCategory.find_or_create_by_name(:name => "Kamus")
puts kamus
kamus_books = Book.where("book_type = 'kamus'").update_all(:book_category_id => kamus.id)

dan_lain_lain = BookCategory.find_or_create_by_name(:name => "YCT & HSK")
puts dan_lain_lain
dan_lain_lain_books = Book.where("book_type = 'dan_lain_lain'").update_all(:book_category_id => dan_lain_lain.id)
