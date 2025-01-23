class Admin::SubjectsController < ApplicationController
  def index
    @subjects = Subject.all
  end

  def edit
    @subject = Subject.find(params[:id])
  end
end
