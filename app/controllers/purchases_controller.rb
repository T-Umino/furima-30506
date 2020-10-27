class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: :index

  def index
    @item = Item.find(params[:item_id])
    if user_signed_in? && current_user.id === @item.user_id
      redirect_to root_path
    end
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      @order.save
      redirect_to item_path(@item.id)
    else
      render action: :index
    end
  end

  private

  def order_params
    @item = Item.find(params[:item_id])
    params.require(:order).permit(:postal_code, :prefecture_id, :municipality, :details, :building_name, :tel).merge(user_id: current_user.id, item_id: @item.id)
  end
end
