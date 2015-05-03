class TaskController < ApplicationController

  before_filter :fetch_task, :except => [:index, :create]
    
  
  def fetch_task
    @task = Task.find_by_id(params[:id])
  end

  def index
    @tasks = Task.all
    render json: @tasks 
  end


	def new
	end
	
	def create
		@task = Task.new(params.require(:task).permit(:name))
		  if @task.save
			render json: @task, status: :created 
		  else
			render json: @task.errors, status: :unprocessable_entity 
		  end
	end

	def destroy
		if @task.destroy
			head :no_content, status: :ok 
		else
			render json: @task.errors, status: :unprocessable_entity 
      end
    end
	
end
