Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'

  root 'welcome#index'
  authenticated :user do
  	#you cant have two root directory so we rename it as something else by using as 
  	root"docs#index" , as: "authenticated_root"
  end

  resources :docs

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
