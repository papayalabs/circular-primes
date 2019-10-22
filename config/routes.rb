Rails.application.routes.draw do
  get '/', to: 'circular_primes#index'
  post '/calculate', to: 'circular_primes#calculate', as: :calculate
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
