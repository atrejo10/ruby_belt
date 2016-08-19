class HistoriesController < ApplicationController

  def create
    amount = params[:amount].to_i
    lender = Lender.find(params[:lender])
    borrower = Borrower.find(params[:borrower])
    history = History.new(amount: amount, lender_id: params[:lender], borrower_id: params[:borrower])

    if history.save
      borrower.update_attribute("raised", borrower.raised + amount)
      lender.update_attribute("money", lender.money - amount)
      redirect_to :back
    else
      flash[:errors] = history.errors.full_messages
      redirect_to :back
    end
  end
end
