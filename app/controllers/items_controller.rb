class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @items = Item.all.order("created_at DESC")
    @categories = Category.all.order("created_at DESC")

    if params[:category_id].present?
      @category = Category.find(params[:category_id])
      @items = @category.items
    end
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      puts @item.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:id])
  end

private
  def item_params
    params.require(:item).permit(
      :name,:describe, :price,:category_id, :condition_id, 
      :deli_charge_id, :prefecture_id, :deli_time_id, :image
      ).merge(user_id: current_user.id)
  end
end
