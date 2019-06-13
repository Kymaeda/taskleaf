class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @q = current_user.tasks.ransack(params[:q])
    @tasks = @q.result(distinct: true)
  end

  def show
  end

  def new
    @task = Task.new
  end

  def confirm_new
    @task = current_user.tasks.new(task_params)
    render :new unless @task.valid?
  end

  def create
    @task = current_user.tasks.new(task_params)

    if params[:back]
      render :new
      return
    end

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
      @task = current_user.tasks.find(params[:id])
    end

    def task_params
      params.
        require(:task).
          permit(
            :name,
            :description,
            :status_value,
            :image,
          )
    end
end
