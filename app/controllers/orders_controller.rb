class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item
  before_action :sold_item

  def index
    if @item.user_id == current_user.id
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      @order_form = OrderForm.new
    end
  end

  def create
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      pay_item(order_params)
      @order_form.save(order_params, current_user.id)
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private
    def order_params
    params.require(:order_form).permit(:post_code, :prefecture_id, :city, :street, :building, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id,token: params[:token])
    end

    def pay_item(order_params)
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
    end

    def set_item
      @item = Item.find(params[:item_id])
    end
    
    def sold_item
      if @item.order
        redirect_to root_path
      end
    end
end
