Rails.application.routes.draw do
  scope '/api' do
    # Users:
    post '/sign-up', to: 'users#create'
    get '/profile/:id', to: 'users#show'
    put '/update-profile/:id', to: 'users#update'
    post '/sign-in', to: 'users#sign_in'

    # Employees:
    get '/availabilities', to: 'employees#index'
    post '/new', to: 'employees#create'
    get '/availability/:id', to: 'employees#show'
    get '/employees', to: 'employees#index'

    # Bookings:
    get '/bookings/history', to: 'bookings#index'
    post '/bookings/new', to: 'bookings#create'
    get '/bookings/current/:id', to: 'bookings#show'
    get '/bookings/current', to: 'bookings#current'
    delete '/bookings/delete', to: 'bookings#destroy'
    
    # Addresses:
    post '/addresses', to: 'addresses#create'
    get '/addresses/:id', to: 'addresses#show'
    put '/update-address/:id', to: 'addresses#update'
    
    # Status:
    get '/status', to: 'status#index'
  end
end
