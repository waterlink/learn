Learn::Application.routes.draw do
  devise_for :users
  root to: 'home#index'
  get '/to', to: 'home#to', as: :to
  mathjax 'mathjax'
  resources :presentations do
    get :print, on: :member
  end
  resources :pages
end
