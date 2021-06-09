class PurchaseInformation < ApplicationRecord
  has_one :delivery
  belongs_to :item
  belongs_to :user
end
