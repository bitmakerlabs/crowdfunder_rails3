class SessionsController < ApplicationController

	# Login page
  def new
  	
  end

  # Login submit action
  def create
		@user = login(params[:email], params[:password])
		if @user
			redirect_to :root, :notice => "Welcome back"
		else
			flash.now[:alert] = "Invalid credentials. Try again?"
			render :new
		end
  end

  # Logout submit
  def destroy
		logout
		redirect_to :root, notice: "Bye... Hope to see you later!"
  end

end
