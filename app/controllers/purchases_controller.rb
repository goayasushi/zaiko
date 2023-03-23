class PurchasesController < ApplicationController
  def new
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new(purchase_params)
    if @purchase.save
      redirect_to clients_path
    else
      render :new
    end
  end

  private 

  def purchase_params
    params.require(:purchase).permit(:part_id, :arrival_day, :purchase_quantity).merge(user_id: current_user.id)
  end
end
