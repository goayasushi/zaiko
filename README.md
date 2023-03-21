# テーブル設計

## Users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |

### Association
- has_many :clients
- has_many :parts
- has_many :purchases
- has_many :sales

## Clients テーブル

| Column        | Type       | Options                        | 
| ------------- | ---------- | ------------------------------ |
| client_name   | string     | null: false                    |
| postcode      | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| block         | string     | null: false                    |
| building      | string     |                                |
| phone         | string     | null: false                    |
| pic           | string     |                                |
| user          | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :parts
- belongs_to :prefecture

## Parts テーブル

| Column         | Type       | Options                        | 
| -------------- | ---------- | ------------------------------ |
| part_name      | string     | null: false                    |
| purchase_price | integer    | null: false                    |
| selling_price  | integer    | null: false                    |
| user           | references | null: false, foreign_key: true |
| client         | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :client
- has_many :purchases
- has_many :sales

## Purchases テーブル

| Column            | Type       | Options                        | 
| ----------------- | ---------- | ------------------------------ |
| arrival_day       | date       | null: false                    |
| purchase_quantity | integer    | null: false                    |
| user              | references | null: false, foreign_key: true |
| part              | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :part

## Sales テーブル

| Column        | Type       | Options                        | 
| ------------- | ---------- | ------------------------------ |
| shipping_day  | date       | null: false                    |
| sale_quantity | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |
| part          | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :part