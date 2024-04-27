class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    validates :name
    validates :describe
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999}
    validates :category_id, numericality: { other_than: 1, message: "can't be blank"} 
    validates :condition_id, numericality: { other_than: 1, message: "can't be blank"} 
    validates :deli_charge_id, numericality: { other_than: 1, message: "can't be blank"} 
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank"} 
    validates :deli_time_id, numericality: { other_than: 1, message: "can't be blank"} 
    validates :image
  end


  belongs_to :user 
  has_one_attached :image
  belongs_to :category
  belongs_to :condition
  belongs_to :deli_charge
  belongs_to :prefecture
  belongs_to :deli_time
  has_one :order
end
