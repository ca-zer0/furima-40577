class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order = Order.new
  end

  def create
    binding.pry
    @order = Order.new(order_params)
    if @order.valid?
       @order.save
       return redirect_to root_path
    else
       @item = Item.find(params[:item_id])
       render :index, status: :unprocessable_entity
    end
  end

  private
    def order_params
    params.require(:order).permit(:post_code, :prefecture_id, :city, :street, :building, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
    end
end
