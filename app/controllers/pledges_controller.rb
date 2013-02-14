class PledgesController < ApplicationController
  
	before_filter :require_login
	before_filter :require_project

  def new
  	@pledge = @project.pledges.build
  end

  def create
		@pledge = @project.pledges.build params[:pledge]
		@pledge.user = current_user
		
		if @pledge.save
			UserMailer.new_pledge(@pledge).deliver
			redirect_to @project, notice: "Nice! Thanks for pledging $#{@pledge.amount} for this project."
		else
			render :new
		end
  end

  protected

  def require_project
  	@project = Project.find params[:project_id]
  end


end
