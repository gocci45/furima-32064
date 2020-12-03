class Address < ApplicationRecord

  belongs_to :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :shipping_address
end
