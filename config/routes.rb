Rails.application.routes.draw do
  root to: "pages#landing"
  resources :pages
end
