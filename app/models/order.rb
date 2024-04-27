class Order < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :item_id, :user_id,:post_code, :prefecture_id, :city, :street, :building, :phone_number, :token
  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :city
    validates :street
    validates :phone_number, format: { with: /\A\d{10,11}\z/,message: "is invalid"}
  end
  def save(params, user_id)
    order = Order.create(item_id: params[:item_id], user_id: user_id)
    Address.create(post_code: params[:post_code], prefecture_id: params[:prefecture_id], city: params[:city], street: params[:street_address], building: params[:building_name], phone_number: params[:phone_number], order_id: order.id)
end

  belongs_to :user
  belongs_to :item
  has_one :address
end
