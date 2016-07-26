ActiveAdmin.register User do

index do
    column :first_name
    column :last_name
    column :email
    column :dob 
    column :gender
    column :veteran
    column :country
	column :state
    column :zip
    column :bio
    actions
end

form do |f|
	inputs 'New User' do
		input :email
	    input :picture
	    input :first_name
	    input :last_name
	    input :dob
	    input :gender
	    input :veteran
	    input :country
		input :state
	    input :zip
	    input :bio
	end
	actions
end
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


end
