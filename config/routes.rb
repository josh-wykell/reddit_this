Rails.application.routes.draw do
  devise_for :users

  resources :posts do
    delete 'upvote', :on => :member, :action => 'downvote'
    put    'upvote', :on => :member, :action => 'upvote'
    delete 'downvote', :on => :member, :action => 'upvote'
    put    'downvote', :on => :member, :action => 'downvote'


  end

  root 'posts#index'
end
