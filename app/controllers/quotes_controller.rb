class QuotesController < ApplicationController
  def index
    @quotes = Quote.page(params[:page]).per(10).without_count
  end

  def new
    @quote = Quote.new
  end

  def create
    @quote = Quote.new(quote_params)

    if @quote.save
      redirect_to quote_path(@quote)
    else
      flash[:danger] = @quote.errors.full_messages.join(". ")
      render :new
    end
  end

  def show
    @quote = Quote.find(params[:id])
  end

  private

  def quote_params
    params.require(:quote).permit(:text, :source, :author)
  end
end
