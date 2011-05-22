ElhuMe::Application.routes.draw do
  match '/contact', :to => 'pages#contact'
  match '/about', :to => 'pages#about'
  match 'portfolio', :to => 'pages#portfolio'

  root :to => 'pages#home'
end
