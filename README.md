# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| family_name        | string  | null: false |
| first_name         | string  | null: false |
| family_katakana    | string  | null: false |
| first_katakana     | string  | null: false |
| birthday           | date    | null: false |

### Association

- has_many :items , dependent: :destroy , through: buyer_item
- has_one :buyer , dependent: :destroy

## buyers テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| post_number     | string     | null: false                    |
| prefectures     | string     | null: false                    |
| city            | string     | null: false                    |
| city_number     | string     | null: false                    |
| building        | string     |                                |
| tel_number      | string     | null: false                    |

### Association

- belongs_to :users
- has_many :items

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| text               | text       | null: false                    |
| cost_id            | references | null: false, foreign_key: true |
| shipping_days_id   | references | null: false, foreign_key: true |
| price              | integer    | null: false                    |
| category_id        | references | null: false, foreign_key: true |
| item_id            | references | null: false, foreign_key: true |
| shipping_adress_id | references | null: false, foreign_key: true |
| status_id          | references | null: false, foreign_key: true |

### Association

- belongs_to :buyer 
- belongs_to :user , dependent: :destroy , through: buyer_item

## user_item テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

