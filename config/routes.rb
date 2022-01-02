Rails.application.routes.draw do
  devise_for :users
  root to: "purchases#index"
end
