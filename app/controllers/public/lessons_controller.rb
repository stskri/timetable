class Public::LessonsController < ApplicationController
  def new
    @subjects = Subject.all
    @lesson = Lesson.new
    @schedule = Schedule.find(params[:schedule_id])
  end

  def create
    schedule = Schedule.find(params[:schedule_id])
    lesson = schedule.lessons.build(lesson_params)
    lesson.subject_id = params[:lesson][:selected_subject_id].to_i
    lesson.schedule_id = schedule.id
    if lesson.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def lesson_params
    params.require(:lesson).permit(:subject_id, :day_of_week, :period, :teacher_name, :start_time, :end_time, :room_name)
  end
end
