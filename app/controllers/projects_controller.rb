class ProjectsController < ApplicationController

	def index
		@projects = Project.all
	end

	def show
		@project = Project.find params[:id]
	end

  protected

  def nav_state
  	@nav = :projects
  end

end
