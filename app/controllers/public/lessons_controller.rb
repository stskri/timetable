class Public::LessonsController < ApplicationController
  def new
    @subjects = Subject.all
    @lesson = Lesson.new
    @schedule = Schedule.find(params[:schedule_id])
  end

  def edit
    @subjects = Subject.all
    @lesson = Lesson.find(params[:id])
    @schedule = Schedule.find(params[:schedule_id])
  end

  def create
    schedule = Schedule.find(params[:schedule_id])
    lesson = schedule.lessons.build(lesson_params)
    lesson.subject_id = params[:lesson][:selected_subject_id].to_i
    lesson.schedule_id = schedule.id
    if lesson.save
      redirect_to schedule_path(schedule)
    else
      redirect_to new_schedule_lesson_path(schedule), alert: '授業の登録に失敗しました'
    end
  end

  def update
    schedule = Schedule.find(params[:schedule_id])
    lesson = Lesson.find(params[:id])
    lesson.subject_id = params[:lesson][:selected_subject_id].to_i
    if lesson.update(lesson_params)
      redirect_to schedule_path(schedule), notice: '授業の更新に成功しました'
    else
      redirect_to edit_schedule_lesson_path(schedule), alert: '授業の更新に失敗しました'
    end
  end

  private

  def lesson_params
    params.require(:lesson).permit(:subject_id, :day_of_week, :period, :teacher_name, :start_time, :end_time, :room_name)
  end
end
