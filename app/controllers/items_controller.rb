class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :ensure_correct_user, only: [:edit, :update]
  before_action :move_to_index, except: [:index, :show]
  

  def index
    @items = Item.order("created_at DESC")
  end

  def show
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

  def edit
    if @item.user_id != current_user.id || @item.purchase.present?
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params) 
      redirect_to item_path(@item)
    else
      
      render :edit,status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    redirect_to items_path
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

    def set_item
      @item = Item.find(params[:id])
     end
  
     def ensure_correct_user
      if current_user.nil? || @item.user_id != current_user.id
        redirect_to root_path
       end
     end
  end
