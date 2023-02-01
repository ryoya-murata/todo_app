class TasksController < ApplicationController

	def index
		@tasks = Task.all.page(params[:page]).per(10)
	end

	def show
		@task = Task.find(params[:id])
	end

	def new
		@task = Task.new
	end

	def create
		@task = Task.new(task_params)
		if @task.save
			flash[:success] = "登録に成功しました"
			redirect_to root_path
		else
			flash.now[:danger] = "登録に失敗しました"
			render :new, status: :unprocessable_entity
		end
	end

	def edit
		@task = Task.find(params[:id])
	end

	def update
		@task = Task.find(params[:id])
		if @task.update(task_params)
			flash[:success] = "タスクを更新しました"
			redirect_to root_path
		else
			flash.now[:danger] = "タスクの編集に失敗しました"
			render :edit, status: :unprocessable_entity
		end
	end

	def destroy
		Task.find(params[:id]).destroy
		flash[:success] = "削除しました"
		redirect_to root_path, status: :see_other
	end

	private

		def task_params
			params.require(:task).permit(:title, :content)
		end

end
