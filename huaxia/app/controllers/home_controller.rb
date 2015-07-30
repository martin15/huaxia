class HomeController < ApplicationController
  def index
    @banners = Banner.all
    @features =  Feature.order("updated_at DESC").limit(3)
    @testimonial = Testimonial.last
    @gxnu = Information.find_by_permalink("short_gxnu")
#    @list_univs = University.where("name in ('Guangxi Normal University',
#                                             'Guilin University of Aerospace Technology',
#                                             'Guangxi Arts Institute',
#                                             'Guangxi Medical University',
#                                             'Hainan Normal University',
#                                             'Hunan Normal University',
#                                             'Wuhan Normal University',
#                                             'Chongqing University of Posts and Telecommunications',
#                                             'Nanjing Normal University',
#                                             'Beijing Language and Culture University',
#                                             'China University of Technology')").select("name")
    @list_univs = University.where("province in ('Guangxi', 'Hainan', 'Hunan',
                                                 'Hubei', 'Chongqing', 'Jiangsu',
                                                 'Beijing', 'Taiwan')").
                             group_by{ |h| h.province }

  end
end
