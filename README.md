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
| birthday          | date    | null: false |
| month             | integer | null: false |
| day               | integer | null: false |

### Association

- has_many :item , dependent: :destroy
- has_one :buyer , dependent: :destroy

## buyer テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| post_number     | string     | null: false                    |
| adress          | string     | null: false                    |
| todohuken       | string     | null: false                    |
| city            | string     | null: false                    |
| banchi          | string     | null: false                    |
| tatemono        | string     |                                |
| tel_number      | string     | null: false                    |

### Association

- belongs_to :users
- has_many :item , through: buyer_item

## item テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| name        | string     | null: false                    |
| text        | text       | null: false                    |
| cost        | string     | null: false                    |
| hassou_days | string     | null: false                    |
| price       | integer    | null: false                    |
| category_id | integer    | null: false                    |
| item_id     | integer    | null: false                    |

### Association

- belongs_to :buyer , through: buyer_item
- belongs_to :user , dependent: :destroy
- belongs_to :category

## buyer_item テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| buyer  | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :buyer
- belongs_to :item

## category テーブル

| Column         | Type   | Options     |
| -------------- | ------ | ----------- |
| category_name  | string | null: false |
| category_jotai | string | null: false |

### Association

- has_many :item