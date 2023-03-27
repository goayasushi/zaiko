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
end
