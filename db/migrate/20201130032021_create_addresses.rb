class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string      :post_number
      t.integer     :shipping_address_id
      t.string      :city
      t.string      :city_number
      t.string      :building
      t.string      :tel_number
      t.references  :purchase, foreign_key: true
      t.timestamps
    end
  end
end
