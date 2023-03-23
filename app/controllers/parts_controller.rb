class PartsController < ApplicationController
  def new
    @part = Part.new
  end

  def create
    @part = Part.new(part_params)
    if @part.save
      redirect_to clients_path
    else
      render :new
    end
  end

  private 

  def part_params
    params.require(:part).permit(:part_name, :client_id, :purchase_price, :selling_price).merge(user_id: current_user.id)
  end
end
