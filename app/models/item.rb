class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # validates :name, presence: true
  # validates :explanation, presence: true
  # validates :category, presence: true, numericality: { other_than: 1 }
  # validates :status, presence: true, numericality: { other_than: 1 }
  # validates :price, presence: true, format: { with: /\A[0-9]{¥300〜9,999,999}+\z/ }
  # validates :delivery_fee, presence: true, numericality: { other_than: 1 }
  # validates :shipping_origin, presence: true, numericality: { other_than: 1 }
  # validates :delivery_date, presence: true, numericality: { other_than: 1 }

  belongs_to :user
  has_many :comments
  has_one :buyer
  has_one_attached :image

  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :delivery_date
  belongs_to_active_hash :shipping_origin
end


