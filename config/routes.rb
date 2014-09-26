Rails.application.routes.draw do
  root 'home#index'
  post 'event' => 'home#event'

  post '/eshq/socket' => 'home#eshq'
end
