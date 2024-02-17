class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :move_to_index, except: [:index, :show]

  def index
    @items = Item.order("created_at DESC")
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = current_user.items.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @item = Item.new
  end

  private


  def item_params
    params.require(:item).permit(:description, :item_name, :category_id, :status_id, :shipping_fee_burden_id, :prefecture_id, :shipping_duration_id, :price, :image)
   end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end