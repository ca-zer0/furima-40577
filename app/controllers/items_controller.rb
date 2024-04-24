class ItemsController < ApplicationController
  def index
  end

  def item_params
    params.require(:item).permit(
      :name,:describe, :price,:Category_id, :condition_id, 
      :deli_charge_id, :prefecture_id, :deli_time_id, :image
      ).merge(user_id: current_user.id)
  end
end
