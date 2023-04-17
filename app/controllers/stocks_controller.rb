class StocksController < ApplicationController
  def index
    @parts = Part.all.includes(:user)
    respond_to do |format|
      format.html
      format.csv do
        send_data render_to_string, filename: "index.csv", type: :csv
      end
    end
  end

  def search
    @parts = Part.all.includes(:user)
    @purchases = Purchase.search(params[:search_day])
    @sales = Sale.search(params[:search_day])
  end
end

