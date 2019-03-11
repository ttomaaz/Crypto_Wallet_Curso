Rails.application.routes.draw do
  resources :mining_types
  get 'welcome/index'
  get '/inicio', to: 'welcome#index'

  resources :coins
  #resources o rails usa para criar algumas rotas padrão para a sua aplicação

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  ##Usando a instrução root to: para indicar as rotas

  root to: "welcome#index"
end
