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
- has_many :purchases


##  destinationテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_code        | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| city             | string     | null: false                    |
| address          | string     | null: false                    |
| building_name    | string     |                                |
| phone_number     | string     | null: false                    |
| purchase         | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase


##  productsテーブル

| Column           | Type       | Option      |
| ---------------- | ---------- | ----------- |
| user             | references | null: false |
| name             | string     | null: false |
| description      | text       | null: false |
| category_id      | integer    | null: false |
| condition_id     | integer    | null: false |
| charge_id        | integer    | null: false |
| prefecture_id    | integer    | null: false |
| shipping_id      | integer    | null: false |
| price            | integer    | null: false |

### Association

- belongs_to :user
- has_one :purchase


##  purchaseテーブル

| Column           | Type       | Option                         |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key :true |
| product          | references | null: false, foreign_key :true |

### Association

- belongs_to :product
- belongs_to :user
- has_one :destination





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
- has_many :purchases


##  destinationテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_code        | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| city             | string     | null: false                    |
| address          | string     | null: false                    |
| building_name    | string     |                                |
| phone_number     | string     | null: false                    |
| purchase         | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase


##  productsテーブル

| Column           | Type       | Option      |
| ---------------- | ---------- | ----------- |
| user             | references | null: false |
| name             | string     | null: false |
| description      | text       | null: false |
| category_id      | integer    | null: false |
| condition_id     | integer    | null: false |
| charge_id        | integer    | null: false |
| prefecture_id    | integer    | null: false |
| shipping_id      | integer    | null: false |
| price            | integer    | null: false |

### Association

- belongs_to :user
- has_one :purchase


##  purchaseテーブル

| Column           | Type       | Option                         |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key :true |
| product          | references | null: false, foreign_key :true |

### Association

- belongs_to :product
- belongs_to :user
- has_one :destination



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
