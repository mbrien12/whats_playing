Rails.application.routes.draw do
  namespace :twilio do
    post 'messages', to: 'messages#create'
  end

  root 'home#index'
  get '/auth/spotify/callback', to: 'home#callback'
end
