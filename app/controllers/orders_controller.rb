class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new
  end

  def create
  @item = Item.find(params[:item_id])
  @order_form = OrderForm.new(order_params)
  if @order_form.valid?
    pay_item(order_params)
    if @order_form.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  else
    render :index, status: :unprocessable_entity
  end
end

  private
    def order_params
    params.require(:order_form).permit(:post_code, :prefecture_id, :city, :street, :building, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id,token: params[:token])
    end

    def pay_item(order_params)
      Payjp.api_key = "sk_test_49c11788ac378b9c903c6032"
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
  end
end
