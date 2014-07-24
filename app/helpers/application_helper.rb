module ApplicationHelper
	 def bootstrap_class_for(flash_type)
		case flash_type
			when "notice"
				"alert-success"
			when "error"
				"alert-danger"
			when "alert"
				"alert-warning"
			when "info"
				"alert-info"
			else
				flash_type.to_s
		end
	end
end
