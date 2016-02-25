Rails.application.routes.draw do
devise_for :admins
get '/contact', to: 'static_pages#contact'

resources :posts
root 'posts#index'

get '/images/:id', to: 'posts#show'
get '/images/new', to: 'posts#new'

get '*path' => redirect('/')

end
