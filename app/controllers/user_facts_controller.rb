class UserFactsController < ApplicationController
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

	def user_fact_params
		params.require(:user).permit(:first_name, :last_name, :date_of_birth, :state, :zip, :country, :gender, :veteran, :bio, :picture)
	end
end