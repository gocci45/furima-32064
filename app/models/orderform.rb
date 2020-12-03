class Orderform
  include ActiveModel::Model
  attr_accessor :post_number , :shipping_address_id , :city , :city_number , :building , :tel_number , :user_id , :item_id , :token


  # ここにバリデーションの処理を書く
  # validates :purchase, presence: true
  # validates :address, presence: true
  
  with_options presence: true do
    validates :post_number , format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :city
    validates :city_number
    validates :tel_number , format: { with: /\A\d{10}\z|\A\d{11}\z/ }
    validates :token
    validates :user_id
    validates :item_id
  end
  with_options numericality: { other_than: 1 } do
    validates :shipping_address_id
  end


  def save
    # 各テーブルにデータを保存する処理を書く
    purchase = Purchase.create(user_id: user_id , item_id: item_id)
    Address.create(post_number: post_number , shipping_address_id: shipping_address_id , city: city , city_number: city_number , building: building , tel_number: tel_number , purchase_id: purchase.id)
  end
end