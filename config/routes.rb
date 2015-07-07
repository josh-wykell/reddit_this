Rails.application.routes.draw do
  get 'comments/create'

  get 'comments/destroy'

  get 'comments/params'

  devise_for :users

  # resources :votes, :only => [:create, :destroy]
  post 'vote', to: 'votes#create'
  delete 'vote', to: 'votes#destroy'

  resources :posts do
    resources :comments, :only => [:create, :destroy]
    # delete 'vote', :on => :member, :action => 'downvote'
    # put    'vote', :on => :member, :action => 'upvote'
  end

  post 'posts/update' => "posts#update"

  root 'posts#index'
end
