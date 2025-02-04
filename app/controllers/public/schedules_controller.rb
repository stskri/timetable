class Public::SchedulesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :dummy]

  # 新規登録画面で登録失敗した際にURLが/usersとなり、リロードするとRouting Errorが表示されてしまうため、routesにget 'users' => 'schedules#dummy'を記述している
  def dummy
    redirect_to new_user_registration_path
  end

  def index
    # public/schedules_pathをroot_pathに指定、未ログインユーザーの場合はログインページへ
    # 「ログインして下さい」のエラーメッセージを表示しないため、 before_action :authenticate_user! ではなく明示的にsign_inページへリダイレクトさせている
    unless user_signed_in?
      redirect_to new_user_session_path and return
    end
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
      redirect_to schedule_path(@schedule), notice: 'スケジュールを作成しました'
    else
      redirect_to new_schedule_path, alert: 'スケジュールの作成に失敗しました'
    end
  end

  def update
    schedule = Schedule.find(params[:id])
    if schedule.update(schedule_params)
      redirect_to edit_schedule_path(schedule), notice: "情報を更新しました"
    else
      redirect_to edit_schedule_path(schedule), alert: "情報の更新に失敗しました"
    end
  end

  def destroy
    schedule = Schedule.find(params[:id])
    if schedule.destroy
      redirect_to root_path, notice: "時間割を削除しました"
    else
      redirect_to root_path, alert: "時間割の削除に失敗しました"
    end
  end

  private
  def schedule_params
    params.require(:schedule).permit(:name, :explanation)
  end
end
