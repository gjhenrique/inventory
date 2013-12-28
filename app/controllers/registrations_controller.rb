class RegistrationsController < Devise::RegistrationsController

	skip_before_filter :require_no_authentication

	load_and_authorize_resource class: User

end
