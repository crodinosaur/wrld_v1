class UserFactsController < ApplicationController
	def edit
	end

	def update
		@user = current_user
		@user.update_attributes(user_fact_params)
		render 'edit'
	end

	def user_fact_params
		params.require(:user).permit(:first_name, :last_name, :date_of_birth, :state, :zip, :country, :gender, :veteran, :bio, :picture)
	end
end
