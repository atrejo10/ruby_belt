class OnlineLendingsController < ApplicationController
  def register
  end

  def login
  end

  def borrower
    @borrower = Borrower.find(session[:user_id])
    @list = History.joins(:lender).where(borrower_id: session[:user_id])

  end

  def lender
    @lender = Lender.find(session[:user_id])
    @borrowers = Borrower.all
    @borrowerslent = History.joins(:borrower).where(lender_id: session[:user_id])
  end
end
