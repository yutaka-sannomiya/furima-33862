class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :contributor_confirmation, only: [:index, :create]

  def index
    @purchase_information_delivery = PurchaseInformationDelivery.new
  end


  def create
    @purchase_information_delivery = PurchaseInformationDelivery.new(purchase_information_delivery_params)
    if @purchase_information_delivery.valid?
      pay_item
      @purchase_information_delivery.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_information_delivery_params
    params.permit(:postal_code, :shipping_area_id, :municipalities, :address, :building, :tel, :purchase_information).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def contributor_confirmation
    redirect_to root_path if @item.purchase_information.present?
    redirect_to root_path if current_user.id == @item.user_id
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_information_delivery_params[:token],
      currency: 'jpy'
    )
  end
end
