class HskController < ApplicationController

  def index
    @hsk =  Information.find_by_title("hsk")
  end
end
