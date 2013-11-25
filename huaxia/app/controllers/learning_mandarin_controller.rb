class LearningMandarinController < ApplicationController

  def index
    @learning_mandarin = Information.find_by_title("learning_mandarin")
  end
end
