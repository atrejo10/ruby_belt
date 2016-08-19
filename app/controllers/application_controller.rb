class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def require_correct_user
    if params[:user_id]
      user = User.find(params[:user_id])
    else
      user = User.find(params[:id])
    end
    redirect_to '/' if current_user != user
  end
#
#   def current_user
#     lender = Lender.find(session[:user_id])
#     if session[:user_id]
#   elsif lender != session[:user_id]
#     borrower = Borrower.find(session[:user_id])
#   end
# end
#   helper_method :current_user
end
