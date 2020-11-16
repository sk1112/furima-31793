# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| encrypted_password | string | null: false, unique: true |
| email              | string | null: false, unique: true |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family_name_kana   | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_many :purchase_records


## items テーブル

| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| name             | string     | null: false       |
| description      | text       | null: false       |
| price            | integer    | null: false       | 
| category_id      | integer    | null: false       |
| condition_id     | integer    | null: false       |
| prefecture_id    | integer    | null: false       |
| delivery_day_id  | integer    | null: false       |
| delivery_fee_id  | integer    | null: false       |
| user             | references | foreign_key: true |

### Association

- belongs_to :user
- has_one    :purchase_record


## shipping_addresses テーブル

| Column           | Type       | Options           |
| ---------------- | -----------| ----------------- |
| postal_code      | string     | null: false       |
| prefecture_id    | integer    | null: false       |
| city             | string     | null: false       |
| detailed_address | string     | null: false       |
| apartment        | string     |                   |
| phone_number     | string     | null: false       |
| purchase_record  | references | foreign_key: true |

### Association

- belongs_to :purchase_record


## purchase_records テーブル

| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| user   | references | foreign_key: true |
| item   | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address