class ItemsController < ApplicationController
  before_action :authenticate_user! , except: [:index]
  before_action :move_to_index, only: [:edit, :update]
  
  def index
    @items = Item.all.order("created_at DESC")
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

  def show
    @item = Item.find(params[:id])
  end


  private

  def move_to_index 
    @item = Prototype.find(params[:id])
    unless current_user.id ==  @item.user.id
        redirect_to root_path
    end
  end

  def item_params
    params.require(:item).permit(:name, :text, :cost_id, :shipping_day_id, :price, :category_id, :shipping_address_id, :status_id, :image).merge(user_id: current_user.id)
  end
end
