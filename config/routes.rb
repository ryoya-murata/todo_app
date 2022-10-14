Rails.application.routes.draw do
  # 一覧画面
  root "tasks#index"
  get "/tasks", to: "tasks#index"
  
  # 新規作成
  get "/tasks/new", to: "tasks#new", as: "new_task"
  
  # 編集
  get "/tasks/:id/edit", to: "tasks#edit", as: "edit_task"
  
  # 編集更新
  patch "tasks/:id", to: "tasks#update"
  
  # 詳細画面
  get "/tasks/:id", to: "tasks#show", as: "task"
  
  # 新規登録
  post "/tasks", to: "tasks#create"
  
  # 削除
  delete "/tasks/:id", to: "tasks#destroy"
  
  resources :tasks
  
  
  
end
