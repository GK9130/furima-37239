# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family_name_kana   | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_day          | date   | null: false               |

### Association

- has_many :products 
- has_many :items


##  destinationテーブル

| Column           | Type    | Options                        |
| ---------------- | ------- | -------------------------------|
| user_id          | integer | null: false                    |
| post_code        | string  | null: false                    |
| prefecture       | integer | null: false                    |
| city             | string  | null: false                    |
| address          | string  | null: false                    |
| building_name    | string  |                                |
| phone_number     | string  | null: false                    |

### Association

- belongs_to :items


##  productsテーブル

| Column           | Type    | Option                         |
| ---------------- | ------- | ------------------------------ |
| name             | string  | null: false                    |
| price            | string  | null: false                    |
| description      | string  | null: false                    |
| prefecture_id    | string  | null: false                    |
| judgment         | string  |                                |
| category_id      | integer | null: false, foreign_key: true |
| brand_id         | integer | null: false, foreign_key: true |
| shipping_id      | integer | null: false, foreign_key: true |
| user_id          | integer | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :items

- belongs_to_active_hash :prefecture


##  itemsテーブル

| Column           | Type    | Option                         |
| ---------------- | ------- | ------------------------------ |
| user_id          | string  | null: false                    |
| product_id       | string  | null: false                    |

### Association

- belongs_to :products





This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
