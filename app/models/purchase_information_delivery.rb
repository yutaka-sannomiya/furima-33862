class PurchaseInformationDelivery
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :shipping_area_id, :municipalities, :address, :building, :tel, :purchase_information

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code
    validates :municipalities
    validates :address
    validates :tel, numericality: {with: /\A[0-9]+\z/, message: 'Half-width number'}
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end

  validates :shipping_area_id, numericality: { other_than: 1 }

  def save
    purchase_information = PurchaseInformation.create(user_id: user_id, item_id: item_id)
    Delivery.create(postal_code: postal_code, shipping_area_id: shipping_area_id, municipalities: municipalities, address: address, building: building, tel: tel, purchase_information: purchase_information)
  end
end