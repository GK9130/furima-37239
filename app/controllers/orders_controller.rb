class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @user_order = UserOrder.new
    @item = Item.find(params[:item_id])
    if @item.user_id == current_user.id || @item.order!= nil
      return redirect_to root_path
    end
  end

  def new
    @user_order = UserOrder.new
  end

  def create
    @user_order = UserOrder.new(order_params)
    @item = Item.find(params[:item_id])
    if @user_order.valid?
      pay_item
      @user_order.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:user_order).permit(:item_id, :token, :name, :price, :post_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end