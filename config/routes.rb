Rails.application.routes.draw do
  root 'survey_results#index'

  resources :survey_results, only: [:show, :index, :create]
end
