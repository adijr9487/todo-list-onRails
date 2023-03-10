class TaskController < ApplicationController
  def create
    @task = Task.new(task_params)
    @task.user = current_user
    if @task.save
      redirect_to users_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to users_task_index_path
  end

  def task_params
    params.require(:task).permit(:action)
  end
end
