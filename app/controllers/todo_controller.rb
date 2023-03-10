class TodoController < ApplicationController
  def create
    @todo = Todo.new(todo_params)
    @todo.user = current_user
    puts @todo.inspect
    if @todo.save
      redirect_to users_todo_index_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @todo = Todo.new
  end

  def index
    @todo = Todo.where(user_id: current_user.id)
  end

  def destroy
    puts 'destroying'
    @todo = Todo.find(params[:id])
    @todo.destroy
    redirect_to users_todo_index_path
  end

  def todo_params
    params.require(:todo).permit(:title, :description, :deadline, :category)
  end
end
