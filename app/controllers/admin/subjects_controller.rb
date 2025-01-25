class Admin::SubjectsController < ApplicationController
  def index
    @subjects = Subject.all
  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def update
    subject = Subject.find(params[:id])
    if subject.update(subject_params)
      redirect_to admin_subjects_path, notice: "科目情報を更新しました"
    else
      redirect_to edit_admin_subject_path(subject), alert: "科目情報の更新に失敗しました"
    end
  end

  def destroy
    subject = Subject.find(params[:id])
    if subject.destroy
      redirect_to admin_subjects_path, notice: "科目情報を削除しました"
    else
      redirect_to admin_subjects_path, alert: "科目情報の削除に失敗しました"
    end
  end

  private
  def subject_params
    params.require(:subject).permit(:name, :color)
  end
end
