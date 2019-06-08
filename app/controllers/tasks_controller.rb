class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to root_path, notice: "タスク【#{@task.name}】を登録しました。"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update!(task_params)
      redirect_to root_path, notice: "タスク【#{@task.name}】を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    if @task.destroy
      redirect_to root_path, notice: "タスク【#{@task.name}】を削除しました。"
    end
  end

  private

    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:name, :description)
    end
end
