class Item < ApplicationRecord
  belongs_to :user 
  has_one :purchase
  has_one_attached :image

  VALID_NUM_REGEX = /\A[0-9]+\z/

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :cost
  belongs_to_active_hash :shipping_address
  belongs_to_active_hash :shipping_day

  with_options presence: true do
    validates :image
    validates :name
    validates :text
    validates :price, numericality: { only_integer: true, greater_than: 300, less_than: 10000000 }, format: { with: VALID_NUM_REGEX }
    with_options numericality: { other_than: 1 } do
      validates :cost_id
      validates :category_id
      validates :shipping_address_id
      validates :status_id
      validates :shipping_day_id
    end
  end
end
