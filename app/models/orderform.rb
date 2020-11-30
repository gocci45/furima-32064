class Orderform
  include ActiveModel::Model
  attr_accessor :post_number , :perfecture , :city , :city_number , :building , :tel_number , :user_id , :item_id

  # ここにバリデーションの処理を書く
  validates :buyinfo, presence: true
  validates :adinfo, presence: true

  def save
    # 各テーブルにデータを保存する処理を書く
    buyinfo = Purchase.create(user_id: user_id , item_id: item_id)
    addinfo = Address.create(post_number: post_number , perfecture: perfecture , city: city , city_number: city_number , building: building , tel_number: tel_number)
  end
end