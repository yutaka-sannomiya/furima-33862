class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @items = Item.all
    #@items = Item.order("created_at DESC")※残しておくように指示がありました。
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :product_name, :description, :category_id, :status_id, :shipping_charge_id, :shipping_area_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end
end
