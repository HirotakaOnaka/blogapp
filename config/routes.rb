Rails.application.routes.draw do
  root to: "blogs#top"
  resources :favorites, only:[:create, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :blogs do
    collection do
      post :confirm
      mount LetterOpenerWeb::Engine, at:"/letter_opener" if Rails.env.development?
    end
  end
end
