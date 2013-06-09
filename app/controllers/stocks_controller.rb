class StocksController < ApplicationController
  def create
    @stock = current_user.stocks.create(params[:stock])
    if @stock.save
      respond_to do |format|
        format.html
      end
    end
  end

  def destroy
  end
end