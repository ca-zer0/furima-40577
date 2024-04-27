class Address < ApplicationRecord
  with_options presence: true do
    validates :post_code
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank"} 
    validates :city
    validates :street
    validates :phone_number
    validates :order
  end

  belongs_to :order
end
