Rails.application.routes.draw do
  # ユーザー用
  # URL /users/sign_in ...
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  scope module: :public do
    root :to => "schedules#index"
    get 'users' => 'schedules#dummy' # 新規登録画面で登録失敗した際にURLが/usersとなり、リロードするとRouting Errorが表示されてしまうため、controller側で redirect_to new_user_registration_path を用意している
    resources :schedules do
      resources :lessons
    end
  end

  namespace :admin do
  end
end
