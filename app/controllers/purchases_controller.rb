class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :sold_out_item, only: [:index]
  before_action :move_to_index

  def index
    @item = Item.find(params[:item_id])
    @orderform = Orderform.new
  end


  def create
    @orderform = Orderform.new(orderform_params)
    if @orderform.valid?
      @item = Item.find(params[:item_id])
      pay_item
      @orderform.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private
  def orderform_params
    params.require(:orderform).permit(:post_number , :shipping_address_id , :city , :city_number , :building , :tel_number).merge(user_id: current_user.id, item_id: params[:item_id] , token: params[:token])
    # params = {orderform: {post_number:"---" } }
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: orderform_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def sold_out_item
    @item = Item.find(params[:item_id])
    redirect_to root_path if @item.purchase.present?
   end

   def move_to_index 
    @item = Item.find(params[:item_id])
    if current_user.id ==  @item.user.id
        redirect_to root_path
    end
  end
end
