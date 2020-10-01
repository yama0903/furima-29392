class OrderShippingAddress

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefectures, :city, :address, :building_name, :phone, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\d{3}[-]\d{4}\z/, message: "include hypone" }
    validates :city
    validates :address
    validates :phone, format: { with: /\d[0-9]\z/, message: "numerical value only" }, length: { maximum: 11 }
    validates :token
  end

  validates :prefectures, numericality: { other_than: 1, message: "can't be blank" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal_code: postal_code, prefectures: prefectures, city: city, address: address, building_name: building_name, phone: phone, order_id: order.id )
  end

end