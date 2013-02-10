class UsersController < ApplicationController

  def new
  	@user = User.new
  end

  def create
  	@user = User.new params[:user]
  	if @user.save
  		auto_login(@user) # Log them in right away. No account verification required
  		redirect_to root_path, notice: "Account created."
  	else
  		render :new
  	end
  end

end
