class ProjectsController < ApplicationController
	before_action :get_project, only: [:show, :edit, :update, :destroy]
	
	def index
		@projects = Project.all
	end
	
	def new
		@project = Project.new
	end
	
	def create
		@project = Project.new(project_params)
		if @project.save
			flash[:notice] = "Project has been created."
			redirect_to @project
		else
			flash.now[:alert] = "Project has not been created."
			render "new"
		end
	end
	
	def show
	end
	
	def edit
	end
	
	def update
		if @project.update(project_params)
			flash[:notice] = "Project has been updated."
			redirect_to @project
		else
			flash.now[:alert] = "Project has not been updated."
			render "edit"
		end
	end
	
	def destroy
		@project.destroy
		flash[:notice] = "Project has been deleted."
		redirect_to projects_path
	end
		
	def get_project
		@project = Project.find(params[:id])
	end
	
	private
	def project_params
		params.require(:project).permit(:name, :description)
	end
end
