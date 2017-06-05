Rails.application.routes.draw do
  get 'product/new'
  get 'product/create'
  post 'product/upload'=>'product#upload'
  post 'product/create' => 'product#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
