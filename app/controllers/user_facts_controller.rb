class UserFactsController < ApplicationController

	before_action :authenticate_user!
	before_action :only_current_user_can_access, only: [:edit, :update]
	
	def index
		@users = User.paginate(page: params[:page])
	end

	def edit
	end

	def update
		@user = current_user
		@user.update_attributes(user_fact_params)
		if @user.save
			flash[:success] = "Your profile has been successfully updated"
			redirect_to root_path
		else
			render 'edit'
		end
	end

	def show
		@user = User.find(params[:id])
		@entries = User.find(params[:id]).entries
	end

	def user_fact_params
		params.require(:user).permit(:first_name, :last_name, :dob, :state, :zip, :country, :gender, :veteran, :bio, :picture)
	end


	def only_current_user_can_access
		@user = User.find(params[:id])
		redirect_to root_path unless current_user?(@user)
	end
end
