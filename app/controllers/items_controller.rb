class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destory]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
 
  def index
     @items = Item.all.order('created_at DESC')
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

  def show
  end

  def edit
    if @item.user_id == current_user.id && @item.order.nil?
    else
      redirect_to root_path
    end
  end

def update
  @item.update(item_params)
  if @item.valid?
    redirect_to item_path(item_params)
  else
    render :edit
  end
end

def destroy
  if @item.user_id == current_user.id
    @item.destroy
    redirect_to root_path
  else
    redirect_to root_path
  end
end

  private

  def item_params
    params.require(:item).permit(:name, :image, :description, :category_id, :condition_id, :prefecture_id, :postage_id, :shipping_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def set_item
    @item = Item.find(params[:id])
  end
end