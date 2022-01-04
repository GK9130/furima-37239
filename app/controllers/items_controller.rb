class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destory]
  before_action :set_item, only: [:edit, :show, :update, :destroy]

  def index
  end

  def new
    @item = Item.new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :explanation, :price, :category_id, :status_id, :postage_id, :prefecture_id, :shipping_day_id).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def set_item
    @item = Item.find(params[:id])
  end
end