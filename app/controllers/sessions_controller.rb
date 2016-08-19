class SessionsController < ApplicationController
  def create
    lender = Lender.find_by_email(params[:email])
    borrower = Borrower.find_by_email(params[:email])


    if lender && lender.authenticate(params[:password])
      session[:user_id] = lender.id
      redirect_to lendings_path(lender.id)
    elsif borrower && borrower.authenticate(params[:password])
        session[:user_id] = borrower.id
        redirect_to borrower_path(borrower.id)
    else
      flash[:errors] = ["Invalid"]
      redirect_to :back
    end
  end

  def destroy
    reset_session
    redirect_to root_path
   end
end
