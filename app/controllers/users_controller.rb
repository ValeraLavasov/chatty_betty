class UsersController < ApplicationController
  def new
  	@user = User.new
  end
  def create
  	@user = User.new(user_params)
  	if @user.save
  		log_in @user
  		flash[:success] = "Welcome to Chat"
  		redirect_to root_path
  	else
  		flash.now[:danger] = "Error check fields"
  		render 'new'
  	end
  end


  private

  	def user_params
  		params.require(:user).permit(:name,:email,
  					:password, :password_confirmation)
  	end

  	def correct_user
  		@user = User.find(params[:id])
  		redirect_to(root_path) unless current_user?(@user)
  	end
end
