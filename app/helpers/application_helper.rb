module ApplicationHelper
	def login_helper style = ''
    if current_user.is_a?(GuestUser)
     (link_to "Register",new_user_registration_path,class: style) + " ".html_safe + (link_to "Login",new_user_session_path,class: style)    
    else  
     link_to "Logout",destroy_user_session_path,method: :delete,class: style
    end 
	end

	def session_helper(layout_name)
    if session[:source] 
     greetings = "Thanks for visiting me form #{session[:source]} and you are on #{layout_name} layout"
     content_tag(:p,greetings,class: "source-greetings")
    end 
	end
end
