# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false |
| family_name        | string  | null: false |
| first_name         | string  | null: false |
| family_katakana    | string  | null: false |
| first_katakana     | string  | null: false |
| birthday           | date    | null: false |

### Association

- has_many :items 
- has_many :purchases

## address テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| post_number     | string     | null: false                    |
| prefecture_id   | integer    | null: false                    |
| city            | string     | null: false                    |
| city_number     | string     | null: false                    |
| building        | string     | null: false                    |
| tel_number      | string     | null: false                    |
| purchase        | reference  | null: false, foreign_key: true |

### Association

- belongs_to :purchase


## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| text               | text       | null: false                    |
| cost_id            | integer    | null: false                    |
| shipping_day_id   | integer    | null: false                    |
| price              | integer    | null: false                    |
| category_id        | integer    | null: false                    |
| shipping_adress_id | integer    | null: false                    |
| status_id          | integer    | null: false                    |
| user               | reference  | null: false, foreign_key: true |

### Association

- belongs_to :user 
- has_one :purchase

## purchases テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | reference  | null: false, foreign_key: true |
| item               | reference  | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address