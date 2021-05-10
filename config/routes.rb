Rails.application.routes.draw do
  get 'pokemon', to: 'pokemon#index'
  get 'pokemon/abilities/:name', to: 'pokemon#abilities'
end
