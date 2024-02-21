class PurchasesController < ApplicationController
before_action :authenticate_user!, only: [:index] 
before_action :set_item, only: [:create]
include ActiveModel::Model
  attr_accessor :token

  def index
    @purchase_address = PurchaseAddress.new
    @item = Item.find(params[:item_id])
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]

    if current_user == @item.user
      redirect_to root_path
    end
  end


  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    @item = Item.find(params[:item_id])
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  
  private
  
  def check_user_authentication
    unless user_signed_in?
      redirect_to root_path
    end
  end

  
  def purchase_params
    params.require(:purchase_address).permit(:postal_code, :prefecture_id, :city, :street_address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(
      amount:@item.price, 
      card: purchase_params[:token],    
      currency: 'jpy'                
    )
  end
end