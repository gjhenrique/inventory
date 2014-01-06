class RegistrationsController < Devise::RegistrationsController

	skip_before_filter :require_no_authentication

	load_and_authorize_resource class: User, except: [:edit, :update]

	def index
		@users = User.all
	end

	def destroy
		user = User.find(params[:id])
		if current_user? user 
			super
		else
			user.destroy
			redirect_to users_path, notice: t("activerecord.successfully.deleted", model: User.model_name.human)
		end
	end

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
