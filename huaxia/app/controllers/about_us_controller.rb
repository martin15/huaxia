class AboutUsController < ApplicationController

  def index
    @about_us = Information.find_by_title("about_us")
  end
end
