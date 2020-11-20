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
- has_one :address, dependent: :destroy
- has_many :purchases

## address テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| post_number     | string     | null: false                    |
| prefectures_id  | integer    | null: false                    |
| city            | string     | null: false                    |
| city_number     | string     | null: false                    |
| building        | string     |                                |
| tel_number      | string     | null: false                    |

### Association

- belongs_to :user


## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| text               | text       | null: false                    |
| cost_id            | integer    | null: false                    |
| shipping_days_id   | integer    | null: false                    |
| price              | integer    | null: false                    |
| category_id        | integer    | null: false                    |
| shipping_adress_id | integer    | null: false                    |
| status_id          | integer    | null: false                    |

### Association

- belongs_to :user 
- has_one :purchase

## purchases テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user_id            | reference  | null: false, foreign_key: true |
| items_id           | reference  | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :items 