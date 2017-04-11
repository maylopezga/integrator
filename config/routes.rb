Rails.application.routes.draw do
  resources :students
  resources :admeafits
  get "welcome/index"
  root 'welcome#index'
  #root :to => 'welcome#index'
  post ':controller(/:action(/:id(.:format)))'
  get ':controller(/:action(/:id(.:format)))'
  #match ':controller(/:action(/:id))(.:format)'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
