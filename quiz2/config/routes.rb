Rails.application.routes.draw do
  get '/supports/new' => 'support#new', as: :new_support
  post '/supports' => 'support#create', as: :supports

  get 'supports/:id' => 'support#show', as: :support
  get '/supports' => 'support#index'

  get '/supports/:id/edit' => 'support#edit', as: :edit_support
  patch '/supports/:id' => 'support#update'

  delete '/supports/:id' => 'support#destroy'

  get '/progress_change/:id' => 'support#progress_change', as: :progress_change
  get '/search' => 'support#search', as: :search

end
