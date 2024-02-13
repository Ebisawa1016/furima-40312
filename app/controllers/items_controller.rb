class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    #@Items = Item.all
  end

  #def show
  #end

  def item_params
    params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end