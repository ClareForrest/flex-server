Rails.application.routes.draw do
  scope '/api' do
    #maybe change to resources :users, except: [:index] ??
    post '/sign-up', to: 'users#create'
    get '/profile/:id', to: 'users#show'
    put '/update-profile/:id', to: 'users#update'
    post '/sign-in', to: 'users#sign_in'

    get '/availabilities', to: 'employees#index'
    post '/new', to: 'employees#create'
    get '/availability/:id', to: 'employees#show'
    get '/employees', to: 'employees#index'

    get '/bookings/history', to: 'bookings#index'
    get '/bookings/new', to: 'bookings#create'
    get '/bookings/current/:id', to: 'bookings#show'
    get '/bookings/current', to: 'bookings#current'
    
    post '/addresses', to: 'addresses#create'
    get '/addresses/:id', to: 'addresses#show'
    put '/update-address/:id', to: 'addresses#update'
    
    get '/status', to: 'status#index'
  end
end
