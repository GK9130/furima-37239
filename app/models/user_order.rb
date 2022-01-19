class UserOrder
  include ActiveModel::Model
  attr_accessor :name, :post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :price, :user_id, :token, :item_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A[0-9]{10,11}\z/, message: 'is invalid' }
    validates :token
  end
  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Payment.create(order_id: order.id, post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number)
  end
end