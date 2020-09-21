class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :name, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1 }
  validates :status_id, presence: true, numericality: { other_than: 1 }
  validates :price, presence: true, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
  validates :delivery_fee_id, presence: true, numericality: { other_than: 1 }
  validates :shipping_origin_id, presence: true, numericality: { other_than: 1 }
  validates :delivery_date_id, presence: true, numericality: { other_than: 1 }
  validates :image, presence: true

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
