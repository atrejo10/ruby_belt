class BorrowersController < ApplicationController
  def create
    borrower = Borrower.new(user_params)
    if borrower.save
      session[:user_id] = borrower.id
      redirect_to borrower_path(borrower.id)
    else
      flash[:error] = borrower.errors.full_messages
      redirect_to :back
    end
end


private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :password, :password_confirmation, :email, :purpose, :description, :money)
  end
end
