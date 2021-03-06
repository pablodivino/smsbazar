Web::Application.routes.draw do
  resources :trees
  get "home/index"
  
  match "/cat/:id" => "home#catalog" 
  match "/add_category" => "home#add_category" 
  match "/delete_category/:id" => "home#delete_category" 
  match "/edit_category/:id" => "home#edit_category" 
  match "/add_adv" => "home#add_adv"
  
  root :to => "home#index"

  match "/advs" => "advs#index"
  match "/advs/delete/:id" => "advs#delete"
  match "/advs/edit/:id" => "advs#edit"
  match "/advs/save" => "advs#save"
  match "/advs/city/:city_name" => "advs#by_city"
  match "/help" => "help#index"

  match "/search" => "search#index"
end
