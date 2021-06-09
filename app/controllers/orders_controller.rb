class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_item, only: [:index]

  def index
    @items = Item.order("created_at DESC")
    @purchase_information_delivery = PurchaseInformationDelivery.new
  end


  def create
    @purchase_information_delivery = PurchaseInformationDelivery.new(purchase_information_delivery_params)
    if @purchase_information_delivery.valid?
      @purchase_information_delivery.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_information_delivery_params
    params.permit(:postal_code, :shipping_area_id, :municipalities, :address, :building, :tel, :purchase_information).merge(user_id: current_user.id, item_id: params[:item_id])
  end


  def set_item
    @item = Item.find(params[:item_id])
  end
end
