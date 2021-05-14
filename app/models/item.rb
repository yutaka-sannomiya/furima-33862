class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category_id
  belongs_to :status_id
  belongs_to :shipping_charge_id
  belongs_to :shipping_area_id
  belongs_to :shipping_day_id

  validates :product_name, :description, presence: true

  validates :category_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }
  validates :shipping_charge_id, numericality: { other_than: 1 }
  validates :shipping_area_id, numericality: { other_than: 1 }
  validates :shipping_day_id, numericality: { other_than: 1 }

  belongs_to :user
  has_one_attached :image
end
