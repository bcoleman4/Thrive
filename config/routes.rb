Rails.application.routes.draw do
  resources :two_outputs
  resources :two_criteria
  resources :two_results
  resources :three_results
  resources :four_results
  resources :five_results
  resources :six_results

  get '/auto6', to: 'six_results#auto6'
  get '/auto5', to: 'five_results#auto5'
  get '/auto4', to: 'four_results#auto4'
  get '/auto3', to: 'three_results#auto3'
  #get '/auto2', to: 'two_results#auto2'
  get '/auto2', to: 'application#auto2'

  get '/output2', to: 'two_outputs#output2'

  get '/', to: 'application#dashboard'
  get '/combinations', to: 'application#combinations'
  get '/results', to: 'application#results'
  get '/criteria', to: 'appliciation#criteria'
  get '/test_database_progress', to: 'application#test_database_progress'
  get '/sample', to: 'application#sample'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
