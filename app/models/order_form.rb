class OrderForm < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post_code, :prefecture_id, :city, :street, :building, :phone_number, :token
  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :post_code, presence: { message: "can't be blank" }, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, allow_blank: true, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :city
    validates :street
    validates :phone_number, presence: { message: "can't be blank" }, format: { with: /\A\d{10,11}\z/, allow_blank: true, message: "is invalid" }
    validates :token
  end
  def save(params,user_id)
    order = Order.create(item_id: params[:item_id].to_i, user_id: user_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, street: street, building: building, phone_number: phone_number, order_id: order.id)
  end
end
