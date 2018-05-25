Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'landings#show'
  get '/:id', to: 'landings#show'
  post '/', to: 'landings#create', as: :url_shortener
end
