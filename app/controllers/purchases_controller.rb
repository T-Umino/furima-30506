class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :move_to_root, only: :index

  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      @order.save
      redirect_to item_path(@item.id)
    else
      render :action :index
    end
  end

  private

  def move_to_root
    if user_signed_in? && current_user.id === @item.user_id
      redirect_to root_path
    end
  end

  def order_params
    params.require(:order).permit(:postal_code, :prefecture, :municipality, :details, :building_name, :tel).merge(user_id: current_user.id, item_id: @item.id)
  end
end
