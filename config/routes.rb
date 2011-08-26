ElhuMe::Application.routes.draw do
	resource :session, :controller => 'sessions'
  resources :categories

  resources :blogs do
    resources :comments
  end

  match '/contact', :to => 'pages#contact'
  match '/about', :to => 'pages#about'
  match 'portfolio', :to => 'pages#portfolio'

  root :to => 'pages#home'
end
