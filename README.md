# テーブル設計

## users テーブル

| Column            | Type    | Options     |
| ----------------- | ------- | ----------- |
| nickname          | string  | null: false |
| email             | string  | null: false |
| password          | string  | null: false |
| family_name       | string  | null: false |
| first_name        | string  | null: false |
| family_katakana   | string  | null: false |
| first_katakana    | string  | null: false |
| year              | integer | null: false |
| month             | integer | null: false |
| day               | integer | null: false |

### Association

- has_many :things , dependent: :destroy
- has_one :buyer , dependent: :destroy

## buyer テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| family_name     | string     | null: false                    |
| first_name      | string     | null: false                    |
| family_katakana | string     | null: false                    |
| first_katakana  | string     | null: false                    |
| post_number     | string     | null: false                    |
| adress          | string     | null: false                    |
| tatemono        | string     |                                |
| tel_number      | string     |                                |
| user_id         | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_many :things

## thing テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| name        | string     | null: false,                   |
| text        | string     | null: false,                   |
| cost        | string     | null: false,                   |
| hassou_days | string     | null: false,                   |
| price       | string     | null: false,                   |
| brand_id    | references | null: false, foreign_key: true |
| category_id | references | null: false, foreign_key: true |
| user_id     | references | null: false, foreign_key: true |

### Association

- belongs_to :buyer
- belongs_to :user , dependent: :destroy
- belongs_to :category
- belongs_to :brand

## category テーブル

| Column         | Type   | Options     |
| -------------- | ------ | ----------- |
| category_name  | string | null: false |
| category_jotai | string | null: false |

### Association

- has_many :things

## brand テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| brand_name | string |             |

### Association

- has_many :things