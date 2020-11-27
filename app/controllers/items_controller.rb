class ItemsController < ApplicationController
  before_action :authenticate_user! , except: [:index, :show]
  before_action :move_to_index, only: [:edit, :update]
  before_action :item_method, only: [:show, :edit, :update, :destroy]
  
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
  end

  def edit
  end

  def update
    if @item.update(item_params) 
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def move_to_index 
    @item = Item.find(params[:id])
    unless current_user.id ==  @item.user.id
        redirect_to root_path
    end
  end

  def item_params
    params.require(:item).permit(:name, :text, :cost_id, :shipping_day_id, :price, :category_id, :shipping_address_id, :status_id, :image).merge(user_id: current_user.id)
  end

  def item_method
    @item = Item.find(params[:id])
  end
end
