class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
       pay_item
       @order.save
       return redirect_to root_path
    else
       @item = Item.find(params[:item_id])
       render :index, status: :unprocessable_entity
    end
  end

  private
    def order_params
    params.require(:order).permit(:post_code, :prefecture_id, :city, :street, :building, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id,token: params[:token])
    end

    def pay_item
    Payjp.api_key = "sk_test_49c11788ac378b9c903c6032"
      Payjp::Charge.create(
        amount: order_params[:price],
        card: order_params[:token],
        currency: 'jpy'
      )
    end
end
