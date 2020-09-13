# テーブル設計

## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| family_name      | string | null: false |
| first_name       | string | null: false |
| family_name_kana | string | null: false |
| first_name_kana  | string | null: false |
| birth_year       | string | null: false |
| birth_month      | string | null: false |
| birth_day        | string | null: false |

- has_many :items
- has_many :orders
- has_many :address

## items テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| image         | string  | null: false |
| name          | string  | null: false |
| text          | text    | null: false | 
| category      | string  | null: false |
| state         | string  | null: false |
| postage       | string  | null: false |
| region        | string  | null: false |
| shipping_date | string  | null: false |
| price         | integer | null: false |

- belongs_to :user
- has_one :order

## orders テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| buyer_user_id | references | null: false, foreign_key: true |
| item_id       | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :item

## address テーブル

| Column       | Type      | Options                        |
| ------------ | --------- | ------------------------------ |
| user_id	     |references | null: false, foreign_key: true |
| postal       | string    | null: false                    |
| prefecture   | string    | null: false                    |
| city         | string    | null: false                    |
| address1     | string    | null: false                    |
| address2     | string    |                                |
| phone_number | string    | null: false                    |

- belongs_to :user