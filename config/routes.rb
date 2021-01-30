Rails.application.routes.draw do
  scope '/api' do
    post '/sign-up', to: 'users#create'
    post '/sign-in', to: 'users#sign_in'
    get '/profile/:id', to: 'users#show'
    
    post '/new', to: 'employees#create'
  end
end
