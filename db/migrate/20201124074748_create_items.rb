class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string      :name
      t.text        :text
      t.integer     :cost_id
      t.integer     :shipping_day_id
      t.integer     :price
      t.integer     :category_id
      t.integer     :shipping_address_id
      t.integer     :status_id
      t.references  :user, foreign_key: true
      t.timestamps
    end
  end
end
