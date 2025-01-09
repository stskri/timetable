class Public::SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
  end

  def new
    @schedule = Schedule.new
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def create
    @schedule = Schedule.new(schedule_params)
    @schedule.user_id = current_user.id
    if @schedule.save
      redirect_to root_path, notice: 'スケジュールを作成しました'
    else
      redirect_to root_path, alert: 'スケジュールの作成に失敗しました'
    end
  end

  private
  def schedule_params
    params.require(:schedule).permit(:name, :explanation)
  end
end
