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

about_us = Information.find_or_create_by_title(:title => "about_us")
puts about_us.inspect

study_at_china = Information.find_or_create_by_title(:title => "study_at_china")
puts study_at_china.inspect

learning_mandarin = Information.find_or_create_by_title(:title => "learning_mandarin")
puts learning_mandarin.inspect

hsk = Information.find_or_create_by_title(:title => "hsk")
puts hsk.inspect

guilin = Category.find_or_create_by_title(:title => "guilin")
puts guilin.inspect

summer_camp = Category.find_or_create_by_title(:title => "summer_camp")
puts summer_camp.inspect

winter_camp = Category.find_or_create_by_title(:title => "winter_camp")
puts winter_camp.inspect


