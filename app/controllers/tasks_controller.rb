class TasksController < ApplicationController
    
    def index
        @tasks = Task.all
    end
    
    def show
        @task = Task.find(params[:id])
    end
    
    def new
        @task = Task.new
    end
    
    def create
        task_params = params.require(:task).permit(:title, :content)
        # データ入りインスタンスの作成
        @task = Task.new(task_params)
        # DBに保存
        if @task.save
        # 詳細画面へリダイレクト
            redirect_to tasks_path
        else
            # バリデーションエラーの時に
           render 'new', status: :unprocessable_entity 
        end
    end
    
    def edit
        @task = Task.find(params[:id])
    end
    
    def update
        @task = Task.find(params[:id])
        task_params = params.require(:task).permit(:title, :content)
        if @task.update(task_params)
           redirect_to tasks_path 
        else
            reder :edit
        end
    end
    
    def destroy
        @task = Task.find(params[:id])
        @task.destroy
        redirect_to tasks_path
    end
end
