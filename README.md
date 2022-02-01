# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| password           | string | null: false               |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| family_name_kana   | string | null: false               |
| given_name         | string | null: false               |
| given_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association
- has_many :items


## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| item_name        | string     | null: false                    |
| description      | text       | null: false                    |
| price            | integer    | null: false                    |
| condition_id     | integer    | null: false                    |
| shipping_cost_id | integer    | null: false                    |
| shipping_days_id | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| category_id      | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase_record
- belongs_to_active_hash :condition
- belongs_to_active_hash :shipping_cost
- belongs_to_active_hash :shipping_days
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :category


## purchase_record テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- has_one :delivery_address


## delivery_address テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| zip_code        | string     | null: false                    |
| prefecture_id   | integer    | null: false, foreign_key: true |
| city            | string     | null: false                    |
| address         | string     | null: false                    |
| building        | string     |                                |
| phone_number    | string     | null: false                    |
| purchase_record | references | null: false                    |

### Association
- belongs_to :purchase_record