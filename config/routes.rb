Rails.application.routes.draw do
  get 'welcome/index'
  resources :coins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  ##Usando a instrução root to: para indicar as rotas

  root to: "welcome#index"
end
