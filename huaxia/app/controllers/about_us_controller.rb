class AboutUsController < ApplicationController

  def index
    @about_us = Information.find_by_title("study_at_china")
  end
end
