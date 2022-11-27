Rails.application.routes.draw do
  namespace :public do
    get 'cooking_details/new'
    get 'cooking_details/create'
    get 'cooking_details/edit'
    get 'cooking_details/update'
    get 'cooking_details/destroy'
  end
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }
  devise_for :members,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
   scope module: :public do
    root to: "homes#top"
    get "home/about" => "homes#about", as: "about"
    
    resources :cookings do
      resources :cooking_details, only: [:new, :create, :edit, :update, :destroy]
      resources :bookmarks, only: [:index, :destroy, :create]
      resources :cooking_comments, only: [:index, :destroy, :create]
    end
    get 'search' => 'cookings#search'
    resources :members, only: [:show, :edit, :update]
    get "member/quit" => "members#quit"
    patch "member/out" => "members#out"
    
    
    
  end
  
  namespace :admin do
    #root to: "homes#top"
    resources :cookings, only: [:index, :show, :edit, :update, :destroy] do
      resources :cooking_comments, only: [:index, :destroy]
    end
    resources :tags, only: [:create, :index, :edit, :update, :destroy]
    resources :members, only: [:show, :index, :edit, :update]
    
    
  end
end
