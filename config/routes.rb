Rails.application.routes.draw do
  root to: "blogs#top"
  resources :favorites, only:[:create, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :blogs do
    collection do
      post :confirm
    end
  end
  mount LetterOpenerWeb::Engine, at:"/inbox" if Rails.env.development?
end
