class Item < ApplicationRecord
  validates :name, presense: true
  validates :explanation, presense: true
  validates :category, presense: true
  validates :status, presense: true
  validates :price, presense: true, format: { with: /\A[0-9]+\z/　}
  validates :delivery_fee, presense: true
  validates :shipping_origin, presense: true
  validates :delivery_date, presense: true

  belongs_to :user
  has_many :comments
  has_one :buyer
end
