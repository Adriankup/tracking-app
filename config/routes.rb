Rails.application.routes.draw do

  root "packages#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :packages, only: %i[index new create update destroy]
end
