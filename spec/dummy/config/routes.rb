Rails.application.routes.draw do
  resources :mutants, only: [:index, :show]
  resources :humans, only: [:index, :show]
end
