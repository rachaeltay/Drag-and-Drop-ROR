Rails.application.routes.draw do
  get 'product/new', to: 'product#new'
  root to: 'product#new'
  post 'upload', to: 'product#upload'
  post 'product/create', to: 'product#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
