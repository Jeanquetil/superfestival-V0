Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'

  resources :festivals, only: :show
  resources :concerts, only: [] do
    resources :events, only: [:create, :destroy]
  end

  get 'timetables', to: 'timetables#ics_export', defaults: { format: 'ics' }
  get 'festivals/:festival_id/timetable/:day' => "festivals#display_timetable", as: :display_timetable
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
