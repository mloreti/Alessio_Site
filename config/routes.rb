Rails.application.routes.draw do
devise_for :admins

root 'static_pages#index'

resources :posts, :path => 'images'

get '/contact', to: 'static_pages#contact'

devise_scope :admin do
  get "/login" => "devise/sessions#new"
  get "/signup" => "devise/registrations#new"
  delete "/logout" => "devise/sessions#destroy"
end

#get '*path' => redirect('/')

end
