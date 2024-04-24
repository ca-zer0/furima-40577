class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :Category

  with_options presence: true do
    validates :name
    validates :describe
    validates :price, format: { with: /\A[0-9]+\z/}, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999}
    validates :user
    validates :category_id, numericality: { other_than: 1, message: "can't be blank"} 
    validates :condition_id, numericality: { other_than: 1, message: "can't be blank"} 
    validates :deli_charge_id, numericality: { other_than: 1, message: "can't be blank"} 
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank"} 
    validates :deli_time_id, numericality: { other_than: 1, message: "can't be blank"} 
    validates :image
  end


  belongs_to :user 
  has_one_attached :image
  has_one :order
end
