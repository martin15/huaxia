class StudentAssociationsController < ApplicationController

  def index
    @student_associations = StudentAssociation.order(:order_no)
    @student_association = StudentAssociation.find_by_permalink(params[:permalink])
    if @student_association.nil?
      redirect_to student_associations_path(StudentAssociation.default.permalink)
      return
    end
  end
end
