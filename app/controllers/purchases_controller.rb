class PurchasesController < ApplicationController
include ActiveModel::Model
  attr_accessor :token

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new(order_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      return redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render 'index', status: :unprocessable_entity
    end
  end


  private

  def purchase_params
    params.require(:purchase).permit(:price).merge(token: params[:token])
  end

  def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  Payjp::Charge.create(
    amount: order_params[:price],  # 商品の値段
    card: order_params[:token],    # カードトークン
    currency: 'jpy'                 # 通貨の種類（日本円）
  )
end
end