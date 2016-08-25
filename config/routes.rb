Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'

  resources :festivals, only: :show
  post "timetables/ics_export"
  resources :concerts, only: [] do
    resources :events, only: [:create, :destroy]
  end

  get 'festivals/:festival_id/timetable/:day' => "festivals#display_timetable", as: :display_timetable
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
