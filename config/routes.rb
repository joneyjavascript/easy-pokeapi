Rails.application.routes.draw do
  get 'pokemon/abilities/:name', to: 'pokemon#abilities'
end
