class Public::LessonsController < ApplicationController
  def new
    @subjects = Subject.all
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new
    @lesson.subject_id = params[:lesson][:selected_subject_id]
    if @lesson.save
      redirect_to root_path
    end
  end
end
