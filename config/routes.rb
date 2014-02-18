Learn::Application.routes.draw do
  devise_for :users
  root to: 'home#index'
  mathjax 'mathjax'
end
