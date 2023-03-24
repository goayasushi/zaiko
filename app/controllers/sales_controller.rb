class SalesController < ApplicationController
  def new
    @sale = Sale.new
  end

  def create
    @sale = Sale.new(sale_params)
    if @sale.save
      redirect_to clients_path
    else
      render :new
    end
  end

  private 

  def sale_params
    params.require(:sale).permit(:part_id, :shipping_day, :sale_quantity).merge(user_id: current_user.id)
  end
end
