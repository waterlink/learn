Learn::Application.routes.draw do
  devise_for :users
  root to: 'home#index'
  mathjax 'mathjax'
  resources :presentations do
    get :print, on: :member
  end
  resources :pages
end
