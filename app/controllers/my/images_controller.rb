class My::ImagesController < ApplicationController

	before_filter :require_login
	before_filter :require_project

	def index
		@images = @project.images.order(:id)
		@image = @project.images.build
	end

	def create
		@image = @project.images.build params[:image]
		if @image.save
			redirect_to [:my, @project, :images], notice: "Image uploaded. Check it out below."
		else
			@images = @project.images.order(:id)
			render :index
		end
	end

	protected

	def require_project
		@project = current_user.projects.find params[:project_id]
	end

  def nav_state
  	@nav = :my_projects
  end

end
