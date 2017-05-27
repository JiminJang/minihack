Rails.application.routes.draw do
  devise_for :users
  resources :posts
  root "posts#gate"

  post 'posts/recommend' => 'posts#recommend'
end

