class StudentAssociationsController < ApplicationController

  def index
    @student_associations = StudentAssociation.order("name")
  end
end
