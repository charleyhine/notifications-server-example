Rails.application.routes.draw do
  root 'home#index'
  post '/' => 'home#post'

  post '/eshq/socket' => 'home#eshq'
end
