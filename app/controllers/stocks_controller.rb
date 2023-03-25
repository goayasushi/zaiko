class StocksController < ApplicationController
  def index
    @parts = Part.all.includes(:user)
  end
end
