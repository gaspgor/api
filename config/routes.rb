Rails.application.routes.draw do
  resources :campaigns
  resources :banners
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  #


  # resolve("banners") { route_for(:banners) }

end
