class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :logged_in?

  def log_in!(user)
  # 	session_token = User.generate_session_token
		# user.session_token = session_token
		session[:session_token] = user.reset_session_token!
		redirect_to user_url(user)
	end

	def user_params
		params.require(:user).permit(:email, :password)
	end

	def current_user
		user = User.find_by_session_token(session[:session_token])
		return nil if user.nil?
		user
		# find User by session_token
		# return user object or nil
	end

	def logged_in?
		# current_user.session_token == session[:session_token]
		#to make this a boolean value
		!!current_user
	end

	def require_login!
		redirect_to new_session_url unless logged_in?
	end
end
