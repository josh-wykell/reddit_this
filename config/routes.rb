Rails.application.routes.draw do
  devise_for :users

  resources :posts do
    delete 'vote', :on => :member, :action => 'downvote'
    put    'vote', :on => :member, :action => 'upvote'

  end

  root 'posts#index'
end
