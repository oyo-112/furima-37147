# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| family_name_kana   | string | null: false               |
| given_name         | string | null: false               |
| given_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association
- has_many :items
- has_one :delivery_address


## items テーブル

| Column           | Type    | Options                        |
| ---------------- | ------- | ------------------------------ |
| seller           | string  | null: false                    |
| item_name        | string  | null: false                    |
| description      | string  | null: false                    |
| price            | string  | null: false                    |
| condition        | string  | null: false                    |
| shipping_cost    | string  | null: false                    |
| shipping_days    | string  | null: false                    |
| dispatch_address | string  | null: false                    |
| user_id          | integer | null: false, foreign_key: true |
| category_id      | integer | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :categories, through: :item_categories
- has_one :purchase_record


## categories テーブル

| Column        | Type   | Options     |
| ------------- | ------ | ----------- |
| category_name | string | null: false |

### Association
- has_many :items, through: :item_categories


## item_categories テーブル

| Column      | Type    | Options     |
| ----------- | ------- | ----------- |
| item_id     | integer | null: false, foreign_key: true |
| category_id | integer | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :category


## purchase_record テーブル

| Column    | Type    | Options                        |
| --------- | ------- | ------------------------------ |
| purchaser | string  | null: false                    |
| item_id   | integer | null: false, foreign_key: true |

### Association
- belongs_to :item
- has_one :delivery_address


## delivery_address テーブル

| Column       | Type    | Options                        |
| ------------ | ------- | ------------------------------ |
| user_id      | integer | null: false, foreign_key: true |
| zip_code     | integer | null: false                    |
| prefecture   | string  | null: false                    |
| city         | string  | null: false                    |
| address      | string  | null: false                    |
| building     | string  |                                |
| phone_number | integer | null: false                    |

### Association
- belongs_to :purchase_record