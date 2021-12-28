Rails.application.routes.draw do
  get 'items', root to: 'items#index'
end
