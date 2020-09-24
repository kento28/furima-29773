# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| family_name        | string | null: false |
| first_name         | string | null: false |
| family_name_kana   | string | null: false |
| first_name_kana    | string | null: false |
| birthday           | date   | null: false |

- has_many :items
- has_many :orders

## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| name          | string     | null: false                    |
| text          | text       | null: false                    |
| category      | integer    | null: false                    |
| condition     | integer    | null: false                    |
| postage       | integer    | null: false                    |
| prefecture    | integer    | null: false                    |
| shipping_days | integer    | null: false                    |
| price         | integer    | null: false                    |

- belongs_to :user
- has_one :order

## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

- has_one :addres
- belongs_to :item
- belongs_to :user


## address テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| order        | references | null: false, foreign_key: true |
| postal       | string     | null: false                    |
| prefecture   | integer    | null: false                    |
| city         | string     | null: false                    |
| address1     | string     | null: false                    |
| address2     | string     |                                |
| phone_number | string     | null: false                    |

- belongs_to :oder

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| id       | string | null: false |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| name     | string | null: false |
| birthday | string | null: false |

## items テーブル

| Column        | Type   | Options     |
| ------------- | ------ | ----------- |
| name          | string | null: false |
| id            | string | null: false |
| image         | string | null: false |
| name          | string | null: false |
| comment       | string | null: false | 
| category      | string | null: false |
| state         | string | null: false |
| postage       | string | null: false |
| region        | string | null: false |
| shipping_date | string | null: false |
| price         | string | null: false |
| saler_id      | string | null: false |
| buyer_id      | string | null: false |

## buys テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| id           | references | null: false, foreign_key: true |
| card_number  | references | null: false, foreign_key: true |
| expiration   | references | null: false, foreign_key: true |
| security_code| references | null: false, foreign_key: true |
| postal       | references | null: false, foreign_key: true |
| prefectures  | references | null: false, foreign_key: true |
| municipality | references | null: false, foreign_key: true |
| address      | references | null: false, foreign_key: true |
| building_name| references | null: false, foreign_key: true |
| phone_number | references | null: false, foreign_key: true |

