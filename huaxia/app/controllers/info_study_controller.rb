class InfoStudyController < ApplicationController

  def index
    @study_at_china = Information.find_by_title("study_at_china")
  end
end
