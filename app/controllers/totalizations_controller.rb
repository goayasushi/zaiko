class TotalizationsController < ApplicationController
  def monthly
    @graph_datas = Sale.chart
  end
end
