Rails.application.routes.draw do
  # 一覧画面
  root "tasks#index"
  get "/tasks", to: "tasks#index"
  
  # # 詳細画面
  get "/tasks/:id", to: "tasks#show", as: "task"
  # resources :tasks
  
end
