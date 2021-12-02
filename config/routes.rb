Rails.application.routes.draw do
  root to: "tracks#new"
  resources :pages
  resources :tracks
end
