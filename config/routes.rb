Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'

  resources :festivals, only: :show


  post 'concerts/:concert_id/events', to: 'festivals#create_event', as: :concert_events
  delete 'concerts/:concert_id/events/:id', to: 'festivals#destroy_event', as: :concert_event
  get 'timetables', to: 'timetables#ics_export', defaults: { format: 'ics' }
  get 'timetables/playlists', to: 'timetables#get_playlist', as: :get_playlist
  get 'festivals/:festival_id/timetable/:day' => "festivals#display_timetable", as: :display_timetable
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
