module ApplicationHelper

	def print_title title = ".title"
		content_for :title do
			t title
		end
	end

	def print_notification
		content_tag(:div, flash[:error], class: "alert alert-danger", :id => "flash_error") if flash[:error]
	 	content_tag(:div, flash[:notice], class: "alert alert-success", :id => "flash_success") if flash[:notice] 
	  content_tag(:div, flash[:alert], class: "alert alert-warning", :id =>"flash_alert") if flash[:alert] 
	end
end
