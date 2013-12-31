class RegistrationsController < Devise::RegistrationsController

	skip_before_filter :require_no_authentication

	load_and_authorize_resource class: User, except: [:edit, :update]

	def create
		super do |resource|
			flash[:notice] = I18n.t('activerecord.successfully.created', model: User.model_name.human) 
			respond_with resource, :location => after_sign_up_path_for(resource)
			return
		end
	end
	protected

	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation) if params[:user]
	end
end
