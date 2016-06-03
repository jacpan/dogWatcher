Rails.application.routes.draw do

  resources :animals

  root 'welcome#index'

  get 'home', to: 'welcome#index', as: :home
  get 'about', to: 'welcome#about', as: :about

  post 'animals/new', to: 'animals#new', as: :new_animal_path

end
