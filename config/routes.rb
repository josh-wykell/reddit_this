Rails.application.routes.draw do
  get 'comments/create'

  get 'comments/destroy'

  get 'comments/params'

  devise_for :users

  resources :posts do
    resources :comments, :only => [:create, :destroy]
    delete 'vote', :on => :member, :action => 'downvote'
    put    'vote', :on => :member, :action => 'upvote'

  
  end

  root 'posts#index'
end
