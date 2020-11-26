class ItemsController < ApplicationController
  before_action :authenticate_user!
  
  def index
  end

  def new
      @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :text, :cost_id, :shipping_day_id, :price, :category_id, :shipping_address_id, :status_id, :image).merge(user_id: current_user.id)
  end
end
