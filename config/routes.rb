Rails.application.routes.draw do
  root to: "blogs#top"
  mount LetterOpenerWeb::Engine, at:"/letter_opener" if Rails.env.development?
  resources :favorites, only:[:create, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :blogs do
    collection do
      post :confirm
    end
  end
end
