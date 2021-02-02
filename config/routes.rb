Rails.application.routes.draw do
  # should be resources
  scope '/api' do
    post '/sign-up', to: 'users#create'
    post '/sign-in', to: 'users#sign_in'
    get '/profile/:id', to: 'users#show'
    
    post '/new', to: 'employees#create'
    get '/availabilities', to: 'employees#index'
    get '/availability/:id', to: 'employees#show'

    get '/employees', to: 'employees#index'

    get '/bookings/new', to: 'bookings#create'
    get '/bookings/current/:id', to: 'bookings#show'
    get '/bookings/history', to: 'bookings#index'

    get '/status', to: 'status#index'

  end
end
