class LendersController < ApplicationController

  def create
  lender = Lender.new(user_params)
  if lender.save
    session[:user_id] = lender.id
    redirect_to lendings_path(lender.id)
  else
    flash[:errors] = lender.errors.full_messages
    redirect_to :back
  end
end


private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :password, :password_confirmation, :email, :money)
  end

end
