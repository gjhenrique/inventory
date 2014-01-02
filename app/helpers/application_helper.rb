module ApplicationHelper

	def print_title title = ".title"
		content_for :title do
			t title
		end
	end

end
